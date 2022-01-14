from django.urls import path

from services.views import CategoriesView, ServicesView, services, tickets, view_tickets

urlpatterns = [
    path('services', services, name="services"),
    path('services_res', ServicesView.as_view()),
    path('categories_res', CategoriesView.as_view()),
    path('tickets', tickets, name="tickets"),
    path('tickets/<int:id>', view_tickets, name="view_ticket"),
]