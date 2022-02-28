from django import template
from dashboard.models import *

register = template.Library()


@register.simple_tag
def site_title():
    try:
        return Settings.objects.first().site_title
    except:
        return False


@register.simple_tag
def site_name():
    try:
        return Settings.objects.first().site_name
    except:
        return False


@register.simple_tag
def get_whatsapp_contact():
    try:
        return Settings.objects.first().whatsapp_no
    except:
        return False


@register.simple_tag
def whatsapp_message():
    try:
        return Settings.objects.first().whatsapp_message
    except:
        return False


@register.simple_tag
def keyword():
    try:
        return Settings.objects.first().keyword
    except:
        return False


@register.simple_tag
def description():
    try:
        return Settings.objects.first().description
    except:
        return False


@register.simple_tag
def logo():
    try:
        return f"/media/{Settings.objects.first().logo}"
    except:
        return False


@register.simple_tag
def payment_img():
    try:
        return f"/media/{Settings.objects.first().pyament_qr}"
    except:
        return False


@register.simple_tag
def favicon_img():
    try:
        return f"/media/{Settings.objects.first().pyament_qr}"
    except:
        return False