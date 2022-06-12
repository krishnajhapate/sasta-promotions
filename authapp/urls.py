from django.urls import path
from .views import *

urlpatterns = [
    path('register', register, name="register"),
    path('login', login, name="login"),
    path('accounts', accounts, name="accounts"),
    path('reset-password', request_password_reset_email,
         name="reset-password"),
    path('verify-otp', reset_password, name="verify-otp"),
    path('change-password', change_password, name="change-password"),
    path('logout', logout_page, name="logout"),
]