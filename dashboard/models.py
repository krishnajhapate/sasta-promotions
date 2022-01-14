from django.db import models

# Create your models here.

class CounterOrder(models.Model):
    counter = models.IntegerField()
