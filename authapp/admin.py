from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as DjangoUserAdmin
from django.db.models.base import Model
from .models import AccountBalance, User


# Register your models here.
@admin.register(User)
class UserAdmin(DjangoUserAdmin):
    list_display = ('id', 'username', 'email', 'phone', 'is_staff',
                    'date_joined')
    list_display_links = (
        'id',
        'username',
        'email',
    )

    ordering = ['-id']

    fieldsets = (('Personal Information', {
        'fields': (
            'username',
            'name',
            'first_name',
            'last_name',
            'phone',
            'email',
            'password',
            'api_key',
        )
    }), )


@admin.register(AccountBalance)
class MoneyAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'money', 'updated')
    readonly_fields = ('money', )

    ordering = ['-updated']
