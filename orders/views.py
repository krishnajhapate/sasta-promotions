from django.shortcuts import render
from .models import OrdersModel, TransanctionsModel
from django.contrib.auth.decorators import login_required
# Create your views here.


@login_required
def orders(request, status=None):
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


def add_funds(request):
    if request.method == "POST":
        amount = request.POST.get('amount', None)
        order_id = request.POST.get('order_id', None)
        transaction = TransanctionsModel.objects.create(
            user=request.user,
            amount=amount,
            transaction_id=order_id,
        )
    transactions = TransanctionsModel.objects.filter(user=request.user)

    return render(request, "add_funds.html",{"transactions":transactions})
