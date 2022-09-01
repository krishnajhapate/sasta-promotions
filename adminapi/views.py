from rest_framework.generics import GenericAPIView
from rest_framework.response import Response
from authapp.models import User, AccountBalance

from .serializers import StatisticsSerializer
from orders.models import OrdersModel
from django.db.models import Sum
from services.models import TicketsModel
from dashboard.models import Settings
# Create your views here.


class StatisticsView(GenericAPIView):

    def get(self, request):
        orders = OrdersModel.objects.all()
        data = {}
        data['total_users'] = User.objects.all().count()
        data['total_amounts'] = orders.filter(status="Completed").aggregate(
            total=Sum('charge'))['total']
        data['total_orders'] = orders.count()
        data['total_tickets'] = TicketsModel.objects.filter(
            status="Pending").count()
        data['total_user_balance'] = AccountBalance.objects.all().aggregate(
            total=Sum('money'))['total']
        data['total_providers_balance'] = Settings.objects.first(
        ).provider_balance

        return Response(data)


class OrdersStatus(GenericAPIView):

    def get(self, request):
        orders = OrdersModel.objects.all()
