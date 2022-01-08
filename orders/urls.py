from django.urls import path
from .views import orders

urlpatterns = [
    path('orders', orders, name="orders"),
    path('orders/<str:status>', orders, name="order_status"),
]