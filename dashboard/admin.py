from django.contrib import admin

from dashboard.models import Api, CounterOrder, Settings, Tutorials
from orders.models import OrdersModel, TransanctionsModel
from authapp.models import User
from services.models import TicketsModel
from datetime import date, timedelta
from django.db.models import Sum, Q
from django.utils.html import format_html
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
                    'total_users', 'todays_fund_recieved', 'todays_update',
                    'todays_new_user', 'tickets')

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

    def todays_fund_recieved(self, request):
        startdate = date.today()
        enddate = startdate + timedelta(days=1)
        return TransanctionsModel.objects.filter(
            created__range=[startdate, enddate]).aggregate(
                total=Sum('amount'))['total']

    def todays_update(self, request):
        startdate = date.today()
        enddate = startdate + timedelta(days=1)

        ordersObj = OrdersModel.objects.all()
        orders = ordersObj.filter(
            Q(status__in=["Completed", "Processing", "In Progress"]),
            Q(order_placed__range=[startdate, enddate]))
        transactions = orders.aggregate(total=Sum('charge'))['total']

        return format_html(f"""
        {orders.count()} orders of {transactions} Rs <br> 
        {ordersObj.filter(status="Processing").count()} - Processing<br>
        {ordersObj.filter(status="Pending").count()} - Pending<br>
        {ordersObj.filter(status="Completed").count()} - Completed<br>
        {ordersObj.filter(status="In progress").count()} - In Progress<br>
        """)

    def todays_new_user(self, request):
        startdate = date.today()
        enddate = startdate + timedelta(days=1)

        return User.objects.filter(is_superuser=False,
                                   date_joined__range=[startdate,
                                                       enddate]).count()

    def tickets(self, request):
        ticket = TicketsModel.objects.filter(status="Pending").count()
        return format_html(
            f"<a href='/admin/services/ticketsmodel/' >{ticket} Unanswered</a>"
        )


@admin.register(Tutorials)
class TutorialsAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'order', 'active')
