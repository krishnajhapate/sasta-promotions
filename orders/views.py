from django.shortcuts import render
from .models import OrdersModel
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
    return render(request, "orders.html", {"orders": orders,"search":search or ""})
