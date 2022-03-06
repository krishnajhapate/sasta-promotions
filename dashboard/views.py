from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from authapp.utils import generate_key
from dashboard.utils import get_cat, place_order
from services.models import ServicesModel
from authapp.models import AccountBalance, User
from django.contrib import messages
import requests
# Create your views here.


def home_page(request):
    services = get_cat(request)
    return render(request, "home.html", {"category": services})


@login_required
def dashboard(request):
    if request.method == "POST":

        order_create, state = place_order(request)
        print(order_create, 'order_create')

        if order_create and state:
            messages.success(
                request, f"""
                <p> <strong>Order id</strong> #{order_create.id}</p>
                                   <p> <strong>Service</strong> {order_create.service.name}  </p>
                                   <p> <strong>Charge</strong> ₹{order_create.charge} </p>
                                   <p> <strong>Quantity</strong> {order_create.quantity}  </p>
                                   <p> <strong>Account Balance</strong> ₹{AccountBalance.objects.get(user=request.user).money}  </p>"""
            )
            return redirect('dashboard')
        if not state:
            services = get_cat(request)
            return render(request, "dashboard.html", {
                "categories": services,
                "error_message": order_create
            })
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
