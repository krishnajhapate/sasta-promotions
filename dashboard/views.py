from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from authapp.utils import generate_key
from dashboard.utils import get_cat, place_order
from services.models import ServicesModel
from authapp.models import AccountBalance, User
from django.contrib import messages
import requests
# Create your views here.

sasta_api = 'https://sastaprovider.com/api/v2?'
sneaker_api_url = 'https://snakerspanel.com/api/v2?'


def home_page(request):
    services = get_cat(request)
    return render(request, "home.html", {"category": services})


async def sneaker_order(sneaker_api):
    res = requests.post(sneaker_api)


@login_required
def dashboard(request):
    error_message = ""
    if request.method == "POST":

        service_id = request.POST.get('service', None)
        link = request.POST.get('link', None)
        quantity = request.POST.get('quantity', None)
        service = ServicesModel.objects.get(id=service_id)
        charge = (service.rate * float(quantity)) / 1000
        account_balance = AccountBalance.objects.get(user=request.user)
        if charge > account_balance.money:
            services = get_cat(request)
            error_message = "No sufficient account balance to place this order"
            return render(request, "dashboard.html", {
                "categories": services,
                "error_message": error_message
            })

        order_create = place_order(request)
        print(order_create, 'order_create')

        if order_create:
            messages.success(
                request, f"""
                <p> <strong>Order id</strong> #{order_create.id}</p>
                                   <p> <strong>Service</strong> {order_create.service.name}  </p>
                                   <p> <strong>Charge</strong> ₹{order_create.charge} </p>
                                   <p> <strong>Quantity</strong> {order_create.quantity}  </p>
                                   <p> <strong>Account Balance</strong> ₹{AccountBalance.objects.get(user=request.user).money}  </p>"""
            )
            return redirect('dashboard')
    services = get_cat(request)
    return render(request, "dashboard.html", {"categories": services})


def about_page(request):
    return render(request, "about.html")


def terms_and_condition_page(request):
    return render(request, "terms.html")


def api_key_generate(request):
    user = User.objects.get(id=request.user.id)
    user.api_key = generate_key(35)
    user.save()
    print(user)
    return redirect('accounts')


def api_page(request):

    return render(request, 'api.html')
