from django.db import models

# Create your models here.


class CounterOrder(models.Model):
    counter = models.IntegerField()


class Settings(models.Model):
    sneaker_api = models.CharField(max_length=300, blank=True, null=True)
    sneaker_active = models.BooleanField(default=False)
    sasta_id = models.CharField(max_length=300, blank=True, null=True)
    sasta_active = models.BooleanField(default=False)
    site_headline = models.CharField(max_length=500, blank=True, null=True)

    class Meta:
        verbose_name = "Setting"
