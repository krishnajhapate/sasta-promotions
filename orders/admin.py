from django.contrib import admin
from .models import *
# Register your models here.


@admin.action(description='Mark selected as completed')
def mark_completed(modeladmin, request, queryset):
    queryset.update(status='Completed')

@admin.action(description='Mark selected as cancelled')
def mark_cancelled(modeladmin, request, queryset):
    queryset.update(status='Cancelled')

@admin.action(description='Mark selected as processing')
def mark_processing(modeladmin, request, queryset):
    queryset.update(status='Processing')

@admin.action(description='Mark selected as pending')
def mark_pending(modeladmin, request, queryset):
    queryset.update(status='Pending')

@admin.action(description='Mark selected as in progress')
def mark_in_progress(modeladmin, request, queryset):
    queryset.update(status='In progress')

@admin.action(description='Mark selected as partial')
def mark_partial(modeladmin, request, queryset):
    queryset.update(status='Partial')



@admin.register(OrdersModel)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'service', 'status', 'quantity','remains', 'charge',
                    'order_placed', 'last_updated')
    list_display_links = ('id', 'service', 'charge')
    list_filter = ('status', )
    readonly_fields = ['third_party_name']
    autocomplete_fields = ['user', 'service']
    actions = [mark_completed,mark_cancelled,mark_processing,mark_pending,mark_in_progress,mark_partial]


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
    autocomplete_fields = ['user',]
    order = ('last_update', )


@admin.register(OrderTransanctionModel)
class OrderTransanctionAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'order', 'transanction_type', 'created']
    list_filter = ('transanction_type', )
    autocomplete_fields = ['user',]
    order = ('created', )


@admin.register(RefilOrders)
class RefilOrdersAdmin(admin.ModelAdmin):
    list_display = ['id','status', 'order','user', 'updated', 'created']
    list_filter = ('status', )
    order = ('updated', )
    search_fields = ('id','order__user__username', 'order__user__email', 'order__user__first_name', 'order__user__last_name','order')
    # autocomplete_fields = ['order']

    def user(self, obj):
        return obj.order.user
