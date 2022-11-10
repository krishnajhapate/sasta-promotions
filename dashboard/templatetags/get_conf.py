from django import template
from dashboard.models import *
from django.utils.safestring import mark_safe
from datetime import datetime, timezone

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


@register.simple_tag
def get_yt_video():
    return Settings.objects.first().youtube_video_link


@register.simple_tag
def get_yt_video_title():
    return Settings.objects.first().video_title


@register.simple_tag
def get_yt_video_height():
    return Settings.objects.first().video_height


@register.simple_tag
def get_yt_video_width():
    return Settings.objects.first().video_width


@register.simple_tag
def order_refill_render(order):

    # print((datetime.now() - order.order_placed).total_hours())
    print(datetime.now(timezone.utc), order.order_placed,
          (datetime.now(timezone.utc) - order.order_placed).total_seconds() /
          (60 * 60))
    if order.refilling:
        return mark_safe(f"""
            <span class="" >Refilling</span>
            """)

    delta = datetime.now(timezone.utc).date() - order.order_placed.date()
    time_obj = (datetime.now(timezone.utc) -
                order.order_placed).total_seconds() / (60)
    hours = int(time_obj / 60)
    minutes = int(time_obj % 60)

    print(delta.days, order.id, order.refill_days)
    if order.refill:

        if order.refill_days is not None and order.refill_days > delta.days:
            return mark_safe(f"""
                <button onClick="location.href = '/refill/{order.id}'" style="padding:2 !important;" class="btn btn-primary text-white btn-sm">Reffil</button>
                """)
        elif hours <= 24:
            return mark_safe(
                f"""<button  type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Refill will be availble in {hours} hours {minutes} minutes ">
            Refill
                </button>""")

    print(order)

    return ""
    try:
        pass
        # if order.refill:
        #     return mark_safe(f"""
        #     <button onClick="location.href = '/refill/{order.id}'" style="padding:2 !important;" class="btn btn-primary text-white btn-sm">Reffil</button>
        #     """)
    except:
        return False