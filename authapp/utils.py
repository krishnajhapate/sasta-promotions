import random
import string
from .models import User
from django.core.mail import send_mail


def generate_key(length=51):
    key = ''.join(
        random.choice(string.ascii_letters + string.digits)
        for _ in range(length))
    user = User.objects.filter(api_key=key)
    if user.exists():
        return generate_key(51)
    return key


def welcome_mail_send(email, firstname):

    send_mail(
        f'Welcome {firstname}',
        f'Hey {firstname} \nWelcome to promotionmaro.com',
        'support@promotionmaro.com',
        [email],
        fail_silently=False,
    )
