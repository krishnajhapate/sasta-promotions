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
    site_title = models.CharField(max_length=100, blank=True, null=True)
    site_name = models.CharField(max_length=500, blank=True, null=True)
    keyword = models.CharField(max_length=500, blank=True, null=True)
    description = models.TextField(max_length=1000, blank=True, null=True)
    logo = models.ImageField(upload_to='image', blank=True, null=True)
    pyament_qr = models.ImageField(upload_to='image', blank=True, null=True)
    # favicon = models.ImageField(upload_to='image', blank=True, null=True)
    whatsapp_no = models.CharField(max_length=100, blank=True, null=True)
    whatsapp_message = models.CharField(max_length=400, blank=True, null=True)
    paytm_merchant_id = models.CharField(max_length=300, blank=True, null=True)
    paytmqr_active = models.BooleanField(default=False)
    video_title = models.CharField(max_length=200, default="")
    youtube_video_link = models.URLField(max_length=1000, default="")
    video_height = models.CharField(default="",
                                    max_length=100,
                                    help_text="Youtube Video Height")
    video_width = models.CharField(default="",
                                   max_length=100,
                                   help_text="Youtube Video Width")

    class Meta:
        verbose_name = "Setting"

    def __str__(self) -> str:
        return f"{self.site_name}"


class Tutorials(models.Model):
    title = models.CharField(max_length=200, blank=True, null=True)
    description = models.TextField(max_length=1000, blank=True, null=True)
    video = models.URLField(blank=True, null=True)
    active = models.BooleanField(default=False)
    order = models.IntegerField(default=0, unique=True)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "Tutorial"