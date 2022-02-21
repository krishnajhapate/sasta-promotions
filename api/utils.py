from authapp.models import User
from services.models import Offers, ServicesModel


def get_user(request):
    key = request.GET.get('key', None)
    user = User.objects.filter(api_key=key)
    if user.exists():
        return user
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