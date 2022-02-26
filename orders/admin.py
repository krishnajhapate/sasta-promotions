from django.contrib import admin
from .models import OrdersModel, TransanctionsModel, OrderTransanctionModel
# Register your models here.


@admin.register(OrdersModel)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'service', 'status', 'quantity', 'charge',
                    'order_placed', 'last_updated')
    list_display_links = ('id', 'service', 'charge')
    list_filter = ('status', )
    readonly_fields = [ 'third_party_name']


@admin.register(TransanctionsModel)
class TransanctionAdmin(admin.ModelAdmin):
    list_display = [
        'id', 'user', 'transanction_type', 'status', 'amount', 'last_updated',
        'created'
    ]
    list_filter = (
        'status',
        'transanction_type',
    )
    order = ('last_update', )


@admin.register(OrderTransanctionModel)
class OrderTransanctionAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'order', 'transanction_type', 'created']
    list_filter = ('transanction_type', )
    order = ('created', )
