import random
import string
from urllib import request
from .models import User


def generate_key(length=51):
    key = ''.join(
        random.choice(string.ascii_letters + string.digits)
        for _ in range(length))
    user = User.objects.filter(api_key=key)
    if user.exists():
        return generate_key(51)
    return key
