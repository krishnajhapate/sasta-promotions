from django.urls import path

from dashboard.views import about_page, home_page, terms_and_condition_page

urlpatterns = [
    path('', home_page, name="home"),
    path('about', about_page, name="about"),
    path('terms', terms_and_condition_page, name="terms_page"),
]