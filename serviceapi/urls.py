from django.urls import path

from serviceapi.views import *

urlpatterns = [
    path('categories', CategoryListAPIView.as_view(), name="services"),
    path('user-categories', UserCategoryListAPIView.as_view(), name="services"),
]
