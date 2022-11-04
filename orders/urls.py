from django.urls import path
from .views import *

urlpatterns = [
    path('orders', orders, name="orders"),
    path('orders/<str:status>', orders, name="order_status"),
    path('add_funds', add_funds, name="add_funds"),
    path('refill/<int:id>', refill_add, name="refill-id"),
    path('refill', refill, name="refill"),
]