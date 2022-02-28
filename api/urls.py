from django.urls import path
from api.views import *
from authapp.utils import generate_key

from dashboard.views import *

urlpatterns = [
    path('', AppApi.as_view()),
]