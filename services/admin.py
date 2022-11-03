from pyexpat import model
from django.contrib import admin
from django.db import models
from services.forms import ServiceAddForm, ServiceAdminAddForm
from django import forms

from services.models import CategoryModel, MessageModel, Offers, ServicesModel, TicketsModel

# Register your models here.


class ServiceModelAdmin(admin.StackedInline):
    model = ServicesModel

    list_display = ('id', )



@admin.action(description='Mark selected as activate')
def mark_active_services(modeladmin, request, queryset):
    queryset.update(active=True)

@admin.action(description='Mark selected as deactivate')
def mark_inactive_services(modeladmin, request, queryset):
    queryset.update(active=False)

class ServiceModelAdminShow(admin.ModelAdmin):
    form = ServiceAdminAddForm

    
    list_display = (
        'id',
        'name',
        'category',
        'rate',
        'api',
        'ranking',
        'refill',
        'service_id',
        'active'
    )
    ordering = ['ranking']

    search_fields = ('id', 'name', 'category', 'api__name', 'service_id',)
    list_filter = (
        'active',
        'category',
    )
    autocomplete_fields = ('category',)
    actions = [mark_active_services, mark_inactive_services]

    def category_name(self, obj):
        return obj.category.name


@admin.register(Offers)
class OfferAdmin(admin.ModelAdmin):
    list_display = (
        'id',
        'service',
        'user',
        'price',
    )
    search_fields = ('user', )
    autocomplete_fields = ('user', 'service')



@admin.action(description='Mark selected as activate')
def mark_active_category(modeladmin, request, queryset):
    queryset.update(active=True)

@admin.action(description='Mark selected as deactivate')
def mark_inactive_category(modeladmin, request, queryset):
    queryset.update(active=False)

class CategoryModelAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'ranking', 'active')
    search_fields = ('id', 'name')
    list_filter = ('active', )
    actions = [mark_active_category, mark_inactive_category]


class MessagesAdmin(admin.TabularInline):

    model = MessageModel
    ordering = ['-timestamp']
    readonly_fields = ('timestamp', )
    fieldsets = ((None, {
        'fields': (
            'user',
            'message',
            'timestamp',
        )
    }), )


@admin.register(TicketsModel)
class TicketsAdmin(admin.ModelAdmin):
    inlines = (MessagesAdmin, )
    list_display = (
        'user',
        'subject',
        'status',
    )


admin.site.register(ServicesModel, ServiceModelAdminShow)
admin.site.register(CategoryModel, CategoryModelAdmin)
