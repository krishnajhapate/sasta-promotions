from celery import task
from core.celery import app
from celery import shared_task
from orders.models import OrdersModel
import requests
from authapp.utils import *
from django.db.models import Q
from dashboard.models import Api, Settings
from celery.schedules import crontab


@task(name="send_welcome_mail")
def send_welcome_mail(email, firstname):

    return welcome_mail_send(email, firstname)


@task(name="reset_password_mail")
def reset_password_mail(email, firstname, otp):

    return send_reset_password_mail(email, firstname, otp)


@task(name="reset_password_mail")
def reset_password_success_mail(email, firstname):

    return send_reset_password_success_mail(email, firstname)


@shared_task(name='place_order')
def place_order():
    orders = OrdersModel.objects.filter(status='Pending')
    for order in orders:
        service = order.service

        if service.api and service.api.active and service.service_id:
            try:
                api_url = service.api.api_url + f"?key={service.api.api_key}&service={service.service_id}&action=add&link={order.link}&quantity={order.quantity}"

                res = requests.get(api_url)
                res = res.json()
                print(api_url, res)
                if res['order']:
                    order.status = "Processing"
                    order.third_party_id = res['order']
                    order.third_party_name = service.api.name
                    order.save()
                else:
                    pass
            except:
                pass
    return True


@shared_task(name='order_status_update')
def order_status_update():
    orders = OrdersModel.objects.exclude(
        Q(status='Completed') | Q(status='Cancelled'))

    for order in orders:
        service = order.service
        try:
            if order.third_party_id:
                api_url = service.api.api_url + f"/?key={service.api.api_key}&action=status&order={order.third_party_id}"
                res = requests.get(api_url)
                res = res.json()
                order_update = OrdersModel.objects.get(id=order.id)
                order_update.status = res['status']
                order_update.start_count = res['start_count']
                if res['status'] == 'Inprogress':
                    order_update.status = 'In progress'
                if res['status'] == 'Pending':
                    order_update.status = 'Processing'
                order_update.save()
        except:
            pass
    return True


@shared_task(name='provider_status_update')
def provider_balance_update():
    api = Api.objects.all().first()
    api_url = api.api_url + f"/?key={api.api_key}&action=balance"
    res = requests.get(api_url)
    res = res.json()
    setting = Settings.objects.first()
    setting.provider_balance = float(res['balance'])
    setting.save()
    return res


app.conf.beat_schedule = {
    # Execute the Speed Test every 10 minutes
    'place-order': {
        'task': 'place_order',
        'schedule': 10.0,
    },
    'order-status-update': {
        'task': 'order_status_update',
        'schedule': 15.0,
    },
    'provider-status-update': {
        'task': 'provider_status_update',
        'schedule': crontab(hour="*/2"),
    },
}