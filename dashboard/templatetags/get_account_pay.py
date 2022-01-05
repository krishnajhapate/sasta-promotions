from django import template

from authapp.models import AccountBalance

register = template.Library()

@register.simple_tag
def get_account_balance(id):
    return AccountBalance.objects.get(id=id)