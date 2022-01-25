from django.conf import settings
from django.shortcuts import render, redirect
from .models import OrdersModel, TransanctionsModel
from django.contrib.auth.decorators import login_required
import requests
from dashboard.models import Settings

# Create your views here.
blow_api = 'https://blowsmmpanels.com/api/v2?'
sneaker_api_url = 'https://snakerspanel.com/api/v2?'


@login_required
def orders(request, status=None):
    orders = OrdersModel.objects.filter(user=request.user)

    for order in orders:
        if order.status == "Processing" or order.status == "Partial" or order.status == "In progress" or order.status == "Pending":
            if order.third_party_id and order.third_party_name:
                settings = Settings.objects.first()
                if order.third_party_name == "Sneaker":

                    sneaker_api = sneaker_api_url + f"key={settings.sneaker_api}&order={order.third_party_id}&action=status"
                    res = requests.post(sneaker_api).json()
                    order_update = OrdersModel.objects.get(id=order.id)
                    order_update.status = res['status']
                    order_update.start_count = res['start_count']
                    if res['status'] == 'Inprogress':
                        order_update.status = 'In progress'
                    order_update.save()

                if order.third_party_name == "Blow":
                    print('here')

    orders = OrdersModel.objects.filter(user=request.user)

    if status:
        orders = orders.filter(status=status)
    search = request.GET.get('search', None)
    if search:
        orders = orders.filter(link__contains=search)
    orders = orders.order_by('-last_updated')
    return render(request, "orders.html", {
        "orders": orders,
        "search": search or ""
    })


@login_required
def add_funds(request):
    transactions = TransanctionsModel.objects.filter(user=request.user)
    if request.method == "POST":
        amount = request.POST.get('amount', None)
        order_id = request.POST.get('order_id', None)
        transaction = TransanctionsModel.objects.create(
            user=request.user,
            amount=amount,
            transaction_id=order_id,
        )
        return redirect('add_funds')
    return render(request, "add_funds.html", {"transactions": transactions})
