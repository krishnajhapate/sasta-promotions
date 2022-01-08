from django.shortcuts import render
from .models import OrdersModel
from django.contrib.auth.decorators import login_required
# Create your views here.


@login_required
def orders(request):
    orders = OrdersModel.objects.filter(user=request.user)
    return render(request, "orders.html", {"orders": orders})
