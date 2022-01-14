from django import template

from services.models import ServicesModel
from dashboard.models import CounterOrder
import random

register = template.Library()


@register.simple_tag
def get_services_count():
    return ServicesModel.objects.all().count()


@register.simple_tag
def get_orders_count():
    counter = CounterOrder.objects.all().first()
    counter.counter = counter.counter + random.randint(2, 101)
    counter.save()
    return counter.counter
