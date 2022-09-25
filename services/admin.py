from pyexpat import model
from django.contrib import admin
from django.db import models
from services.forms import ServiceAddForm

from services.models import CategoryModel, MessageModel, Offers, ServicesModel, TicketsModel

# Register your models here.


class ServiceModelAdmin(admin.StackedInline):
    model = ServicesModel

    list_display = ('id', )


class ServiceModelAdminShow(admin.ModelAdmin):
    list_display = (
        'id',
        'name',
        'category',
        'rate',
        'api',
        'ranking',
    )
    ordering = ['ranking']
    list_filter = (
        'active',
        'category',
    )


@admin.register(Offers)
class OfferAdmin(admin.ModelAdmin):
    list_display = (
        'id',
        'service',
        'user',
        'price',
    )
    search_fields = ('user', )


class CategoryModelAdmin(admin.ModelAdmin):
    # add_form = ServiceAddForm

    # add_fieldsets = ((None, {
    #     'classes': ('wide', ),
    #     'fields': ('name', 'active', 'url'),
    # }), )

    list_display = ('id', 'name', 'ranking', 'active')
    list_filter = ('active', )


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
