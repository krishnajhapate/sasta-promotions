from django.contrib import admin
from .models import OrdersModel
# Register your models here.


@admin.register(OrdersModel)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('id', 'service', 'status', 'quantity', 'charge')
    list_display_links = ('id', 'service', 'charge')

    list_filter = ('status', )
