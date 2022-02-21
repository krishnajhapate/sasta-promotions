from django.urls import path
from authapp.utils import generate_key

from dashboard.views import about_page, api_key_generate, api_page, dashboard, home_page, terms_and_condition_page

urlpatterns = [
    path('dashboard/', dashboard, name="dashboard"),
    path('generate-key', api_key_generate, name="generate-key"),
    path('', home_page, name="home"),
    path('api', api_page, name="api"),
    path('about', about_page, name="about"),
    path('terms', terms_and_condition_page, name="terms_page"),
]