from services.models import CategoryModel, Offers, ServicesModel


def get_ser(request):
    offer_services = False
    if request.user.is_authenticated:
        offer_services = Offers.objects.filter(
            user=request.user).order_by('id')

    service_main = ServicesModel.objects.filter(
        active=True).order_by('ranking')

    services = []
    if offer_services:
        print(offer_services)
        if offer_services.filter(offer_type="Percentage",
                                 service__isnull=True).exists():
            offer = offer_services.filter(offer_type="Percentage",
                                          service__isnull=True).first()

            for ser in service_main:
                ser.rate = ser.rate - (ser.rate * offer.price) / 100
        else:
            for ser in offer_services:
                # print(ser.service, ser.service.rate, ser.offer_type)
                if ser.service and ser.offer_type == "Percentage":
                    ser.service.rate = ser.service.rate - (ser.service.rate *
                                                           ser.price) / 100
                    services.append(ser.service)
                else:
                    ser.service.rate = ser.price
                    services.append(ser.service)

    for ser in service_main:
        if ser.id not in [x.id for x in services]:
            services.append(ser)

    return services