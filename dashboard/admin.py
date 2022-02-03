from django.contrib import admin

from dashboard.models import CounterOrder, Settings
from orders.models import OrdersModel, TransanctionsModel
from authapp.models import User
# Register your models here.


@admin.register(CounterOrder)
class CounterAdmin(admin.ModelAdmin):
    list_display = ('id', 'counter')


@admin.register(Settings)
class SettingsAdmin(admin.ModelAdmin):
    list_display = ('sneaker_active', 'sasta_active', 'total_orders',
                    'total_transactions', 'total_users')

    add_fields = ((None, ('Site')), )

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
