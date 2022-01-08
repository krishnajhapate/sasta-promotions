from django.db import models
from services.models import ServicesModel
from authapp.models import User
# Create your models here.

STATUS_CHOICE = (
    ("Pending", "Pending"),
    ("Completed", "Completed"),
    ("Processing", "Processing"),
    ("Cancelled", "Cancelled"),
    ("Partial", "Partial"),
    ("In progress", "In progress"),
)


class OrdersModel(models.Model):

    service = models.ForeignKey(ServicesModel, on_delete=models.Case)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    status = models.CharField(max_length=20,
                              choices=STATUS_CHOICE,
                              default="Pending")
    link = models.URLField(blank=True, null=True)
    quantity = models.IntegerField(blank=True, null=True)
    charge = models.FloatField(blank=True, null=True)
    last_updated = models.DateTimeField(auto_now=True)
    order_placed = models.DateTimeField(auto_now_add=True)

    def __str__(self) -> str:
        return self.service.name + "-" + self.status

    class Meta:
        verbose_name = "Order"
