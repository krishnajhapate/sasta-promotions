from django.shortcuts import redirect, render
from django.urls import reverse
from .models import OrdersModel, RefilOrders, TransanctionsModel
from django.contrib.auth.decorators import login_required
import requests
from dashboard.models import Settings
import json
from django.db.models import Q

url = "https://securegw.paytm.in/merchant-status/getTxnStatus"

# Create your views here.
sasta_api_url = 'https://sastaprovider.com/api/v2?'
sneaker_api_url = 'https://snakerspanel.com/api/v2?'


@login_required
def orders(request, status=None):

    orders = OrdersModel.objects.filter(user=request.user)

    if status:
        orders = orders.filter(status=status)
    search = request.GET.get('search', None)
    if search:
        orders = orders.filter(link__contains=search)
    orders = orders.order_by('-order_placed')
    return render(request, "orders.html", {
        "orders": orders,
        "search": search or ""
    })


@login_required
def refill(request, status=None):
    orders = RefilOrders.objects.filter(
        Q(status="Processing") | Q(status="Pending") | Q(status="In progress")
        | Q(status="Partial"))

    order_ids = []
    if orders.count() > 0:
        for order in orders:
            order_ids.append(order.order.third_party_id)
        order_ids = ','.join(str(x) for x in order_ids)

    print(order_ids)
    for order in orders:
        service = order.order.service
        try:
            if order.order.third_party_id:
                api_url = service.api.api_url + f"/?key={service.api.api_key}&action=refill_status&refill={order.order.third_party_id}"
                res = requests.get(api_url, params=request.GET)
                res = res.json()
                print(res)
                order_update = RefilOrders.objects.get(id=order.id)
                order_update.status = res['status']
                order_update.remains = res['remains']
                order_update.save()
        except:
            pass

    orders = OrdersModel.objects.filter(user=request.user)

    if status:
        orders = orders.filter(status=status)
    search = request.GET.get('search', None)
    if search:
        orders = orders.filter(link__contains=search)
    orders = orders.order_by('-order_placed')
    return render(request, "refill.html", {
        "orders": orders,
        "search": search or ""
    })


@login_required
def refill_add(request, id):
    print(id)
    return redirect(reverse('refill'))


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
