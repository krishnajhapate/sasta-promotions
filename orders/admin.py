from django.contrib import admin
from .models import OrdersModel, TransanctionsModel, OrderTransanctionModel
# Register your models here.


@admin.register(OrdersModel)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('id', 'service', 'status', 'quantity', 'charge')
    list_display_links = ('id', 'service', 'charge')
    list_filter = ('status', )


@admin.register(TransanctionsModel)
class TransanctionAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'transanction_type', 'status', 'amount']
    list_filter = (
        'status',
        'transanction_type',
    )


@admin.register(OrderTransanctionModel)
class OrderTransanctionAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'order', 'transanction_type', 'created']
    list_filter = ('transanction_type', )
