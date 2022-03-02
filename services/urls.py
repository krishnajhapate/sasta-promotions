from django.urls import path

from services.views import *

urlpatterns = [
    path('services', services, name="services"),
    path('add-services', add_new_service, name="add-services"),
    path('services_res', ServicesView.as_view()),
    path('categories_res', CategoriesView.as_view()),
    path('view_ticket/<int:id>', view_tickets, name="view_ticket"),
    path('tickets', tickets, name="tickets"),
]