from typing import Tuple
from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.db.models.fields.related import OneToOneField
from django.utils.translation import gettext_lazy as _

# Create your models here.


class User(AbstractUser):

    name = models.CharField(max_length=100, blank=True)
    phone = models.CharField(max_length=100, blank=True)
    api_key = models.CharField(max_length=500, blank=True, null=True)
    otp = models.IntegerField(blank=True, null=True)
    password_reset = models.DateTimeField(blank=True, null=True)
    sent_otp_times = models.IntegerField(default=0)

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['name']

    # objects = CustomUserManager()

    def __str__(self):
        return str(self.first_name)


class AccountBalance(models.Model):
    user = OneToOneField(User, on_delete=models.CASCADE)
    money = models.FloatField(default=0.00)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return self.user.username + "- " + str(self.money) + " Rs "
