from django.db import models

# Create your models here.

class CounterOrder(models.Model):
    counter = models.IntegerField()

class Settings(models.Model):
    sneaker_api = models.CharField