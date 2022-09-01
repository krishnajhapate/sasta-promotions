from django.urls import path
from .views import *

urlpatterns = [
    path(
        'dashboard',
        StatisticsView.as_view(),
    ),
]