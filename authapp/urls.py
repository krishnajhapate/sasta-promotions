from django.urls import path
from .views import accounts, change_password, login, logout_page, register

urlpatterns = [
    path('register', register, name="register"),
    path('login', login, name="login"),
    path('accounts', accounts, name="accounts"),
    path('change-password', change_password, name="change-password"),
    path('logout', logout_page, name="logout"),
]