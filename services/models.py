import imp
from operator import mod
from pyexpat import model
from tabnanny import verbose
from django.db import models
from django.conf import settings
# Create your models here.

User = settings.AUTH_USER_MODEL


class CategoryModel(models.Model):
    name = models.CharField(max_length=400)
    active = models.BooleanField(default=False)
    ranking = models.IntegerField(blank=True, null=True, unique=True)

    def __str__(self) -> str:
        return self.name

    class Meta:
        verbose_name = "Categorie"
        ordering = ('id', )


class ServicesModel(models.Model):
    category = models.ForeignKey(CategoryModel, on_delete=models.CASCADE)
    name = models.CharField(max_length=400)
    min_order = models.IntegerField()
    max_order = models.IntegerField()
    rate = models.FloatField(help_text="Per 1000 ")
    average_time_hours = models.IntegerField(blank=True, null=True)
    average_time_minutes = models.IntegerField(blank=True, null=True)
    description = models.TextField(max_length=4000, blank=True, null=True)
    active = models.BooleanField(default=False)
    is_refill = models.BooleanField(default=False)

    sasta_id = models.IntegerField(blank=True, null=True)
    sasta_active = models.BooleanField(default=False)

    snakers_id = models.IntegerField(blank=True, null=True)
    snakers_active = models.BooleanField(default=False)

    def __str__(self) -> str:
        return self.name

    class Meta:
        verbose_name = "Service"


MESSAGE_STATUS = (
    ('Pending', 'Pending'),
    ('Answered', 'Answered'),
)


class TicketsModel(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    subject = models.CharField(max_length=400, blank=True, null=True)
    status = models.CharField(choices=MESSAGE_STATUS,
                              max_length=20,
                              default="Pending")
    created = models.DateTimeField(auto_now_add=True)
    last_updated = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Ticket"


class MessageModel(models.Model):
    ticket = models.ForeignKey(TicketsModel, on_delete=models.CASCADE)
    user = models.ForeignKey(User,
                             on_delete=models.CASCADE,
                             blank=True,
                             null=True)
    message = models.CharField(max_length=200, null=True, blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self) -> str:
        return "message#" + str(self.id)

    class Meta:
        verbose_name = "Message"
