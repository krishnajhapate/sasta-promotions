from django import template
from dashboard.models import *
from django.utils.safestring import mark_safe



register = template.Library()


@register.simple_tag
def promotional_description():
    try:
        return mark_safe(Settings.objects.first().promotional_description )
    except:
        return ""

@register.simple_tag
def promotional_image():
    try:
        return Settings.objects.first().promotional_image 
    except:
        return ""

@register.simple_tag
def promotional_link():
    try:
        return Settings.objects.first().promotional_link 
    except:
        return ""