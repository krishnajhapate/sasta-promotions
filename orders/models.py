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
    ("Test", "Test"),
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
    start_count = models.IntegerField(blank=True,null=True)
    last_updated = models.DateTimeField(auto_now=True)
    order_placed = models.DateTimeField(auto_now_add=True)

    third_party_id = models.CharField(max_length=10, blank=True, null=True)
    third_party_name = models.CharField(max_length=20, blank=True, null=True)

    def __str__(self) -> str:
        return self.service.name + "-" + self.status

    class Meta:
        verbose_name = "Order"


TRANSANCTION_STATUS = (
    ('Pending', 'Pending'),
    ('Approved', 'Approved'),
    ('Cancelled', 'Cancelled'),
    ('Not Valid', 'Not Valid'),
    ('Test', 'Test'),
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
                                         choices=TRANSANCTION_TYPE,
                                         default='Credit')
    method = models.CharField(max_length=20,
                              choices=METHOD_STATUS,
                              default='QR')
    status = models.CharField(max_length=20,
                              choices=TRANSANCTION_STATUS,
                              default='Pending')
    transaction_id = models.CharField(max_length=400, blank=True, null=True)
    amount = models.FloatField()
    last_updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "Transanction"


class OrderTransanctionModel(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    order = models.ForeignKey(OrdersModel, on_delete=models.CASCADE)
    transanction_type = models.CharField(max_length=20,
                                         choices=TRANSANCTION_TYPE,
                                         default="Debit")
    note = models.CharField(max_length=100, blank=True, null=True)
    created = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "Order History"
