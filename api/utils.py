from authapp.models import AccountBalance, User
from services.models import Offers, ServicesModel
from orders.models import OrdersModel
from rest_framework.response import Response
from rest_framework import status
import requests


def get_user(request):
    key = request.GET.get('key', None)
    user = User.objects.filter(api_key=key)
    if user.exists():
        return user.first()
    else:
        return False


def get_ser(user):
    offer_services = False
    if user:
        offer_services = Offers.objects.filter(user=user).order_by('id')

    service_main = ServicesModel.objects.filter(active=True).order_by('id')

    services = []
    if offer_services:
        for ser in offer_services:
            ser.service.rate = ser.price
            services.append(ser.service)

    for ser in service_main:
        if ser.id not in [x.id for x in services]:
            services.append(ser)

    return services


def place_order(request, user):
    offers = Offers.objects.filter(user=user)
    service_id = request.GET.get('service', None)
    link = request.GET.get('link', None)
    quantity = request.GET.get('quantity', None)

    # checking parameters
    if service_id == None or link == None or quantity == None:
        return False, "Invalid parameters"

    service = ServicesModel.objects.filter(id=service_id)

    if not service.exists():
        return False, "Service not exists"

    service = service.first()

    offers = offers.filter(service=service)
    if offers.exists():
        service = offers.first().service
        service.rate = offers.first().price
    charge = (service.rate * float(quantity)) / 1000

    # balance check
    account_balance = AccountBalance.objects.get(user=user)
    if charge > account_balance.money:
        error_message = "No sufficient account balance to place this order"
        return False, error_message

    order_create = OrdersModel.objects.create(
        service=service,
        quantity=quantity,
        link=link,
        charge=charge,
        user=user,
    )
    if service.api and service.api.active and service.service_id:
        api_url = service.api.api_url + f"?key={service.api.api_key}&service={service.service_id}&action=add&link={order_create.link}&quantity={order_create.quantity}"
        res = requests.post(api_url, params=request.GET)
        print(api_url)
        print(res, res.json())
        # try:
        if res.json()['order']:
            order_create.status = "Processing"
            order_create.third_party_id = res.json()['order']
            order_create.third_party_name = 'sasta'
            order_create.save()
        # except:
        #     pass

    return order_create, True


def order_status(request, user):
    order_id = request.GET.get('order', None)

    if order_id == None:
        return False, "Invalid parameters"

    order = OrdersModel.objects.filter(id=order_id)

    if not order.exists():
        return False, "Order id  invalid"

    return order.first(), True


def account_status(request, user):
    return AccountBalance.objects.filter(user=user).first(), True
