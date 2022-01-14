from django import template

from orders.models import OrdersModel
from services.models import ServicesModel

register = template.Library()


@register.simple_tag
def get_services_count():
    return ServicesModel.objects.all().count()


@register.simple_tag
def get_spent_balance(user):
    balance = OrdersModel.objects.filter(user=user).exclude(status="Cancelled")
    total = 0
    for i in balance:
        total += i.charge
    return total