from services.models import CategoryModel, Offers, ServicesModel


def get_ser(request):
    offer_services = False
    if request.user.is_authenticated:
        offer_services = Offers.objects.filter(
            user=request.user).order_by('id')

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