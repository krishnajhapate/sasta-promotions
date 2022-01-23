from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as DjangoUserAdmin
from django.db.models.base import Model
from .models import AccountBalance, User


# Register your models here.
@admin.register(User)
class UserAdmin(DjangoUserAdmin):
    list_display = ('id', 'username', 'email', 'phone', 'is_staff')
    list_display_links = ('id', 'username', 'email', 'phone')

    ordering = ['-id']


@admin.register(AccountBalance)
class MoneyAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'money', 'updated')

    ordering = ['-updated']
