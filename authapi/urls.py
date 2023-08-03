# urls.py

from django.urls import path
from .views import UserRegistrationView, UserLoginView, UserInfo

urlpatterns = [
    path('register/', UserRegistrationView.as_view(), name='user-registration'),
    path('login', UserLoginView.as_view(), name='user-login'),
    path('user-info', UserInfo.as_view(), name='user-info'),
    # Add other authentication-related endpoints here (e.g., logout, password reset)
]
