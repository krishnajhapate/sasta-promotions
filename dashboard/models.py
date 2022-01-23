from django.db import models

# Create your models here.


class CounterOrder(models.Model):
    counter = models.IntegerField()


class Settings(models.Model):
    sneaker_api = models.CharField(max_length=300, blank=True, null=True)
    sneaker_active = models.BooleanField(default=False)
    blow_api = models.CharField(max_length=300, blank=True, null=True)
    blow_active = models.BooleanField(default=False)
    site_headline = models.CharField(max_length=500,blank=True,null=True)