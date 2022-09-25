from django.urls import path
from authapp.utils import generate_key

from dashboard.views import *

urlpatterns = [
    path('dashboard/', dashboard, name="dashboard"),
    path('generate-key', api_key_generate, name="generate-key"),
    path('', home_page, name="home"),
    path('tutorials', tutorials, name="tutorials"),
    path('api', api_page, name="api"),
    path('about', about_page, name="about"),
    path('terms', terms_and_condition_page, name="terms_page"),
]