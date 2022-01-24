from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from services.models import CategoryModel, ServicesModel
from orders.models import OrdersModel
from authapp.models import AccountBalance
from django.contrib import messages
from .models import Settings
import requests
# Create your views here.

blow_api = 'https://blowsmmpanels.com/api/v2?'
sneaker_api_url = 'https://snakerspanel.com/api/v2?'


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
    categories = CategoryModel.objects.filter(active=True)

    services = []
    for category in categories:
        service = ServicesModel.objects.filter(active=True, category=category)
        if service.count() > 0:
            category.services = service
            services.append(category)

    error_message = ""
    if request.method == "POST":
        service_id = request.POST.get('service', None)
        link = request.POST.get('link', None)
        quantity = request.POST.get('quantity', None)
        service = ServicesModel.objects.get(id=service_id)
        charge = (service.rate * float(quantity)) / 1000
        account_balance = AccountBalance.objects.get(user=request.user)
        if charge > account_balance.money:
            error_message = "No sufficient account balance to place this order"
            return render(request, "dashboard.html", {
                "categories": services,
                "error_message": error_message
            })

        order_create = OrdersModel.objects.create(
            service=service,
            quantity=quantity,
            link=link,
            charge=charge,
            user=request.user,
        )

        # placing order from api
        settings = Settings.objects.first()

        if settings.blow_active:
            if service.blow_active and service.blow_id:
                blow_api_url = blow_api + f"key={settings.blow_api}&service={service.blow_id}&action=add&link={order_create.link}&quantity={order_create.quantity}"
                print(blow_api_url)
                res = requests.post(
                    blow_api_url, headers={'content-type': 'application/json'})
                print(res)

                # if res.json()['order']:
                #     order_create.status = "Processing"
                #     order_create.third_party_id = res.json()['order']
                #     order_create.third_party_name = 'Blow'
                #     order_create.save()

                # print(res.json())

        # for sneaker
        if settings.sneaker_active:
            if service.snakers_active and service.snakers_id:
                sneaker_api = sneaker_api_url + f"key={settings.sneaker_api}&service={service.snakers_id}&action=add&link={order_create.link}&quantity={order_create.quantity}"
                res = requests.post(sneaker_api)
                if res.json()['order']:
                    order_create.status = "Processing"
                    order_create.third_party_id = res.json()['order']
                    order_create.third_party_name = 'Sneaker'
                    order_create.save()

                print(res.json())

        print(settings)

        if order_create:
            messages.success(
                request, f"""
                <p> <strong>Order id</strong> #{order_create.id}</p>
                                   <p> <strong>Service</strong> {order_create.service.name}  </p>
                                   <p> <strong>Charge</strong> ₹{order_create.charge} </p>
                                   <p> <strong>Quantity</strong> {order_create.quantity}  </p>
                                   <p> <strong>Account Balance</strong> ₹{AccountBalance.objects.get(user=request.user).money}  </p>"""

                # {
                #     "balance":
                #     AccountBalance.objects.get(user=request.user).money,
                #     "order": order_create
                # }
            )
            return redirect('dashboard')

    return render(request, "dashboard.html", {"categories": services})


def about_page(request):
    return render(request, "about.html")


def terms_and_condition_page(request):
    return render(request, "terms.html")
