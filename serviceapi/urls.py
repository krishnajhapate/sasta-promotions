from django.urls import path

from serviceapi.views import *

urlpatterns = [
    path('categories', CategoryListAPIView.as_view(), name="services"),
    path('user-categories', UserCategoryListAPIView.as_view(), name="services"),
    path('tickets', TicketsAPIView.as_view(), name='ticket-list'),
    path('tickets/<int:id>', ViewTicketsAPIView.as_view(),
         name='ticket-detail'),
    # path('tickets/<int:ticket_id>/messages/',
    #      MessageCreateView.as_view(), name='message-create'),
]
