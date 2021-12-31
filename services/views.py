from django.shortcuts import render

from services.models import CategoryModel, ServicesModel

# Create your views here.


def services(request):
    categories = CategoryModel.objects.filter(active=True)
    services = []
    for category in categories:
        service = ServicesModel.objects.filter(active=True, category=category)
        if service.count() > 0:
            category.services = service
            services.append(category)
    # print(categories)
    return render(request, 'services.html', {"categories": services})
