from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from authapp.utils import generate_key
from dashboard.models import Tutorials
from dashboard.utils import get_cat, place_order
from services.models import ServicesModel
from authapp.models import AccountBalance, User
from orders.models import OrdersModel
from django.contrib import messages
from django.db.models import Q
import requests
# Create your views here.


def home_page(request):
    services = get_cat(request)
    return render(request, "home.html", {"category": services})


@login_required
def dashboard(request):
    if request.method == "POST":
        service_id = request.POST.get('service', None)
        link = request.POST.get('link', None)
        order = OrdersModel.objects.filter(
            service=ServicesModel.objects.get(id=service_id),
            link=link,
            user=request.user,
            status__in=["Processing", "In progress", "Pending", "Partial"])

        if order.exists():
            messages.error(
                request, f"""
                <h3>Your order has not placed</h3>
                <p>  Your  have an active order with this link and service</p>
                                   """)

            return redirect('dashboard')

        order_create, state = place_order(request)

        if order_create and state:
            messages.success(
                request, f"""
                <h3>Your order has been placed</h3>
                <p> <strong>ID</strong> #{order_create.id}</p>
                                   <p> <strong>Service</strong> {order_create.service.name}  </p>
                                   <p> <strong>Link</strong> {order_create.link}  </p>
                                   <p> <strong>Quantity</strong> {order_create.quantity}  </p>
                                   <p> <strong>Charge</strong> ₹{order_create.charge} </p>
                                   <p> <strong>Balance</strong> ₹{AccountBalance.objects.get(user=request.user).money}  </p>"""
            )
            return redirect('dashboard')

        if not state:
            services = get_cat(request)
            return render(request, "dashboard.html", {
                "categories": services,
                "error_message": order_create
            })

    # update order status
    orders_obj = OrdersModel.objects.filter(
        Q(status="Processing") | Q(status="In progress")
        | Q(status="Partial")).exclude(third_party_id__isnull=True)

    order_ids = []
    if orders_obj.count() > 0:
        for order in orders_obj:
            order_ids.append(order.third_party_id)
        order_ids = ','.join(str(x) for x in order_ids)

        order_status_fetch_url = f"{orders_obj[0].service.api.api_url}?orders={order_ids}&key={orders_obj[0].service.api.api_key}&action=status"
        response = requests.get(order_status_fetch_url)
        if response.status_code == 200:
            response = response.json()
            print(response)
            for order_id in order_ids.split(','):
                order_details = response[order_id]
                order = OrdersModel.objects.get(third_party_id=order_id)
                try:
                    if order_details['error']:
                        order.status = '-'
                        order.save()
                        continue
                except:
                    order.status = order_details['status']
                    order.remains = order_details['remains']
                    order.spend = order_details['charge']
                    order.start_count = order_details['start_count']
                    order.save()
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


def tutorials(request):
    _tutorials = Tutorials.objects.filter(active=True).order_by('-order')

    return render(request, 'tutorials.html', {'tutorials': _tutorials})
