from django import template

from authapp.models import AccountBalance, User
from orders.models import OrdersModel
from dashboard.models import Settings

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


@register.simple_tag
def get_whatsapp_contact():
    return Settings.objects.first().whatsapp_no