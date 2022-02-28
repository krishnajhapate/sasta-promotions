from django import template

from authapp.models import AccountBalance
from orders.models import OrdersModel

register = template.Library()


@register.simple_tag
def get_account_balance(user):
    return round(AccountBalance.objects.get(user=user).money, 2)


@register.simple_tag
def get_spent_balance(user):
    balance = OrdersModel.objects.filter(user=user).exclude(status="Cancelled")
    total = 0
    for i in balance:
        total += i.charge
    return round(total, 2)
