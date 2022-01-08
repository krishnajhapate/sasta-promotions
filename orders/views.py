from django.shortcuts import render
from .models import OrdersModel
# Create your views here.


def orders(request):
    orders = OrdersModel.objects.filter()
    return render(request, "orders.html")
