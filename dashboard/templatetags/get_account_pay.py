from django import template

from authapp.models import AccountBalance, User

register = template.Library()


@register.simple_tag
def get_account_balance(user):
    return AccountBalance.objects.get(user=user).money