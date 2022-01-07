from django.urls import path

from services.views import ServicesView, services

urlpatterns = [
    path('services', services, name="services"),
    path('services_res', ServicesView.as_view()),

]