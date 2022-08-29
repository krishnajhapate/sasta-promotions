from celery import task
from core.celery import app
from celery import shared_task
from orders.models import OrdersModel
import requests
from authapp.utils import *
from django.db.models import Q


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
def place_order():
    orders = OrdersModel.objects.exclude(
        Q(status='Completed') | Q(status='Cancelled'))

    for order in orders:
        if not order.third_party_id:
            continue
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


app.conf.beat_schedule = {
    # Execute the Speed Test every 10 minutes
    'network-speedtest-10sec': {
        'task': 'place_order',
        'schedule': 10.0,
    },
}