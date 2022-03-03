from django.contrib import admin

from dashboard.models import Api, CounterOrder, Settings
from orders.models import OrdersModel, TransanctionsModel
from authapp.models import User
# Register your models here.

admin.site.site_header = "Promotion maro"


@admin.register(CounterOrder)
class CounterAdmin(admin.ModelAdmin):
    list_display = ('id', 'counter')


@admin.register(Api)
class ApiAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'api_url', 'active')


@admin.register(Settings)
class SettingsAdmin(admin.ModelAdmin):
    list_display = ('site_name', 'total_orders', 'total_transactions',
                    'total_users')

    def total_orders(self, request):
        return OrdersModel.objects.filter(status="Completed").count()

    def total_transactions(self, request):
        return TransanctionsModel.objects.filter(status="Approved").count()

    def total_users(self, request):
        return User.objects.filter(is_superuser=False).count()

    def has_delete_permission(self, request, obj=None):
        if Settings.objects.all().count() > 0:
            return False
        return True

    def has_add_permission(self, request, obj=None):
        if Settings.objects.all().count() > 0:
            return False
        return True
