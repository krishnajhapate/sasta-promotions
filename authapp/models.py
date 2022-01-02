from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.utils.translation import gettext_lazy as _

# Create your models here.


class User(AbstractUser):
    
    name = models.CharField(max_length=100, blank=True)
    phone = models.CharField(max_length=100, blank=True)
 
    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['name']

    # objects = CustomUserManager()

    def __str__(self):
        return str(self.name)

