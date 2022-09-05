from django.conf import settings
from django.http import HttpRequest, HttpResponse
from django.shortcuts import render, redirect
from .models import OrdersModel, TransanctionsModel
from django.contrib.auth.decorators import login_required
import requests
from dashboard.models import Settings
import json

url = "https://securegw.paytm.in/merchant-status/getTxnStatus"

# Create your views here.
sasta_api_url = 'https://sastaprovider.com/api/v2?'
sneaker_api_url = 'https://snakerspanel.com/api/v2?'


@login_required
def orders(request, status=None):
    orders = OrdersModel.objects.filter(user=request.user)

    for order in orders:
        if order.status == "Processing" or order.status == "Partial" or order.status == "In progress" or order.status == "Pending":
            service = order.service
            try:
                if order.third_party_id:
                    api_url = service.api.api_url + f"/?key={service.api.api_key}&action=status&order={order.third_party_id}"
                    res = requests.get(api_url, params=request.GET)
                    res = res.json()
                    print(res)
                    order_update = OrdersModel.objects.get(id=order.id)
                    order_update.status = res['status']
                    order_update.start_count = res['start_count']
                    order_update.remains = res['remains']
                    if res['status'] == 'Inprogress':
                        order_update.status = 'In progress'
                    if res['status'] == 'Pending':
                        order_update.status = 'Processing'
                    if res['status'] == "Canceled":
                        order_update.status = "Cancelled"
                    order_update.save()
            except:
                pass

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

        # responding to duplicate id
        transaction_obj = TransanctionsModel.objects.filter(
            transaction_id=order_id)

        if transaction_obj.exists():
            return render(
                request, "add_funds.html", {
                    "transactions": transactions,
                    "success": False,
                    "message": f"Invalid order id"
                })

        settings = Settings.objects.all().first()
        data = {"MID": settings.paytm_merchant_id, "ORDERID": order_id}

        #

        try:
            # calling api to paytm to check status
            res = requests.post(
                url=url,
                data=json.dumps(data),
            )
            res = res.json()

            if float(res['TXNAMOUNT']) == float(amount):

                transaction = TransanctionsModel.objects.create(
                    user=request.user,
                    amount=float(amount),
                    transaction_id=order_id,
                    status="Approved",
                )

                return render(
                    request, "add_funds.html", {
                        "transactions":
                        transactions,
                        "success":
                        True,
                        "message":
                        f"Your request is approved for {transaction.amount}"
                    })
        except:
            return render(
                request, "add_funds.html", {
                    "transactions": transactions,
                    "success": False,
                    "message": f"Ooops! Please try again after some time"
                })

    return render(request, "add_funds.html", {"transactions": transactions})
