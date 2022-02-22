from django.db import models

# Create your models here.


class CounterOrder(models.Model):
    counter = models.IntegerField()


class Api(models.Model):
    name = models.CharField(max_length=100, blank=True, null=True)
    api_key = models.CharField(max_length=500, blank=True, null=True)
    api_url = models.CharField(max_length=500, blank=True, null=True)
    active = models.BooleanField(default=False)

    def __str__(self):
        return self.name


class Settings(models.Model):
    site_headline = models.CharField(max_length=500, blank=True, null=True)
    whatsapp_no = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        verbose_name = "Setting"
