from django.urls import path
from authapp.utils import generate_key

from .views import *

urlpatterns = [
    path('order', OrderCreateView.as_view(), name="orders"),
]
