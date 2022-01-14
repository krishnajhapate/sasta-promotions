from django.contrib import admin

from dashboard.models import CounterOrder

# Register your models here.


@admin.register(CounterOrder)
class CounterAdmin(admin.ModelAdmin):
    list_display = ('id', 'counter')
