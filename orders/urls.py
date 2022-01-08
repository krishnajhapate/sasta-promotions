from django.urls import path
from .views import add_funds, orders

urlpatterns = [
    path('orders', orders, name="orders"),
    path('orders/<str:status>', orders, name="order_status"),
    path('add_funds', add_funds, name="add_funds"),
]