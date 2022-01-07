from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from services.models import CategoryModel, ServicesModel
# Create your views here.


def home_page(request):
    if request.user.is_authenticated:
        return redirect('dashboard')
    categories = CategoryModel.objects.filter(active=True)

    services = []
    for category in categories:
        service = ServicesModel.objects.filter(active=True, category=category)
        if service.count() > 0:
            category.services = service
    return render(request, "home.html", {"category": services})


@login_required
def dashboard(request):

    if request.method == "POST":
        print(request.POST)


    categories = CategoryModel.objects.filter(active=True)

    print(categories)
    services = []
    for category in categories:
        service = ServicesModel.objects.filter(active=True, category=category)
        if service.count() > 0:
            category.services = service
            services.append(category)

    return render(request, "dashboard.html", {"categories": services})


def about_page(request):
    return render(request, "about.html")


def terms_and_condition_page(request):
    return render(request, "terms.html")
