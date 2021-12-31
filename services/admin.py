from django.contrib import admin
from django.db import models

from services.models import CategoryModel, ServicesModel

# Register your models here.


class ServiceModelAdmin(admin.StackedInline):
    model = ServicesModel

    list_display = ('id', )


class ServiceModelAdminShow(admin.ModelAdmin):
    list_display = ('id', 'name','category','rate','active')
    list_filter = ('active','category',)


class CategoryModelAdmin(admin.ModelAdmin):
    # inlines = [ServiceModelAdmin]
    list_display = ('id','name','active' )
    list_filter = ('active',)




admin.site.register(ServicesModel, ServiceModelAdminShow)
admin.site.register(CategoryModel, CategoryModelAdmin)
