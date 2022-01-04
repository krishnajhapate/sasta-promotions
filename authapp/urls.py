from django.urls import path
from .views import login, logout_page, register

urlpatterns = [
    path('register', register, name="register"),
    path('login', login, name="login"),
    path('logout', logout_page, name="logout"),
]