from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from services.models import CategoryModel, ServicesModel
from orders.models import OrdersModel
from authapp.models import AccountBalance
from django.contrib import messages
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

        order_create = OrdersModel.objects.create(service=service,
                                                  quantity=quantity,
                                                  link=link,
                                                  charge=charge,
                                                  user=request.user)

        if order_create:
            messages.success(
                request, 
                f"""
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
