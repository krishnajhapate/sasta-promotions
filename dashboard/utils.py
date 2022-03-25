from authapp.models import AccountBalance
from orders.models import OrdersModel
from django.shortcuts import render

from services.models import CategoryModel, Offers, ServicesModel


def get_cat(request):
    offer_services = False
    if request.user.is_authenticated:
        offer_services = Offers.objects.filter(user=request.user)

    categories = CategoryModel.objects.filter(active=True)

    services = []
    for category in categories:
        temp_ser = []
        service = ServicesModel.objects.filter(active=True, category=category)

        if offer_services and offer_services.filter(offer_type="Percentage",
                                                    service__isnull=True):
            offer = offer_services.filter(offer_type="Percentage",
                                          service__isnull=True).first()
            for ser in service:
                if ser.id not in [x.id for x in temp_ser]:
                    ser.rate = ser.rate - (ser.rate * offer.price) / 100
                    temp_ser.append(ser)
            category.services = temp_ser
            services.append(category)
            continue
        else:
            if offer_services:
                for ser in offer_services:
                    if ser.service and ser.service.category == category:
                        if ser.offer_type == "Percentage":
                            ser.service.rate = ser.service.rate - (
                                ser.service.rate * ser.price) / 100
                            temp_ser.append(ser.service)
                        else:
                            ser.service.rate = ser.price
                            temp_ser.append(ser.service)

        if service.count() > 0:
            for ser in service:
                if ser.id not in [x.id for x in temp_ser]:
                    temp_ser.append(ser)
            category.services = temp_ser
            services.append(category)

    return services


def place_order(request):
    offers_obj = Offers.objects.filter(user=request.user)
    service_id = request.POST.get('service', None)
    link = request.POST.get('link', None)
    quantity = request.POST.get('quantity', None)
    service = ServicesModel.objects.get(id=service_id)
    offers = offers_obj.filter(service=service)

    if offers_obj.filter(offer_type="Percentage",
                         service__isnull=True).exists():
        offer_price = offers_obj.filter(offer_type="Percentage",
                                        service__isnull=True).first()
        service.rate = service.rate - (service.rate * offer_price.price) / 100

    if offers.exists():
        service = offers.first().service
        if offers.first().offer_type == "Percentage":
            service.rate = service.rate - (service.rate *
                                           offers.first().price) / 100
        else:
            service.rate = offers.first().price

    charge = (service.rate * float(quantity)) / 1000
    account_balance = AccountBalance.objects.get(user=request.user)

    if charge > account_balance.money:
        error_message = "No sufficient account balance to place this order"
        return error_message, False
    order_create = OrdersModel.objects.create(
        service=service,
        quantity=quantity,
        link=link,
        charge=charge,
        user=request.user,
    )
    # if service.api and service.api.active and service.service_id:
    #     api_url = service.api.api_url + f"?key={service.api.api_key}&service={service.service_id}&action=add&link={order_create.link}&quantity={order_create.quantity}"
    #     res = requests.post(api_url, params=request.GET)
    #     try:
    #         if res.json()['order']:
    #             order_create.status = "Processing"
    #             order_create.third_party_id = res.json()['order']
    #             order_create.third_party_name = 'sasta'
    #             order_create.save()
    #     except:
    #         pass

    return order_create, True
