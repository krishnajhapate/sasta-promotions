from django.urls import path

from websiteapi.views import *

urlpatterns = [
    path('web-info', WebsiteInfo.as_view(), name="web-info"),
]