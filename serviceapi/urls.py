from django.urls import path

from serviceapi.views import *

urlpatterns = [
    path('categories', CategoryListAPIView.as_view(), name="services"),
]