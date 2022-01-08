from django.db import models
from services.models import ServicesModel
from django.conf import settings

User = settings.AUTH_USER_MODEL
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


TRANSANCTION_STATUS = (
    ('Pending', 'Pending'),
    ('Approved', 'Approved'),
    ('Cancelled', 'Cancelled'),
    ('Not Valid', 'Not Valid'),
)

TRANSANCTION_TYPE = (
    ('Credit', 'Credit'),
    ('Debit', 'Debit'),
)
METHOD_STATUS = (('QR', 'QR'), )


class TransanctionsModel(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    is_approved = models.BooleanField(default=False)
    transanction_type = models.CharField(max_length=20,
                                         choices=TRANSANCTION_TYPE)
    method = models.CharField(max_length=20, choices=METHOD_STATUS)
    status = models.CharField(max_length=20, choices=TRANSANCTION_STATUS)
    amount = models.IntegerField()
    last_updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)

    # def __str__(self) -> str:
    #     return self.

    class Meta:
        verbose_name = "Transanction"