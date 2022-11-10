from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.db.models.fields.related import OneToOneField
from django.utils.translation import gettext_lazy as _
from django.dispatch import receiver
from django.db.models.signals import post_save
import requests
from orders.models import OrdersModel, TransanctionsModel, OrderTransanctionModel
from services.models import ServicesModel
# Create your models here.


class User(AbstractUser):

    name = models.CharField(max_length=100, blank=True)
    phone = models.CharField(max_length=100, blank=True)
    api_key = models.CharField(max_length=500, blank=True, null=True)

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['name']

    # objects = CustomUserManager()

    def __str__(self):
        return str(self.first_name) + " -> " + str(self.username)


class AccountBalance(models.Model):
    user = OneToOneField(User, on_delete=models.CASCADE)
    money = models.FloatField(default=0.00)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return self.user.first_name + "- " + str(self.money) + " Rs "


@receiver(post_save, sender=OrdersModel)
def update_account_balance_on_order(instance, sender, *args, **kwargs):
    if instance.status == "Pending":
        if OrderTransanctionModel.objects.filter(
                order=instance.id, transanction_type="Debit").count() > 0:
            pass
        else:
            balance = AccountBalance.objects.get(user=instance.user)
            balance.money = balance.money - instance.charge
            balance.save()
            OrderTransanctionModel.objects.create(
                user=instance.user,
                order=instance,
            )
            instance.link = instance.link.split("?")[0]

            service = ServicesModel.objects.get(id=instance.service.id)
            if service.api and service.api.active and service.service_id:
                try:
                    api_url = service.api.api_url + f"?key={service.api.api_key}&service={service.service_id}&action=add&link={instance.link}&quantity={instance.quantity}"

                    res = requests.get(api_url)
                    res = res.json()
                    print(api_url, res)
                    if res['order']:
                        instance.status = "Processing"
                        instance.third_party_id = res['order']
                        instance.third_party_name = service.api.name
                        instance.refill_days = instance.service.refill_days
                        instance.refill = instance.service.refill
                        instance.save()
                    else:
                        pass
                except:
                    pass
    if instance.status == "Pending" and instance.third_party_id:
        instance.status = "Processing"
        instance.save()

    if instance.status == "Cancelled" or instance.status == "Partial":
        if OrderTransanctionModel.objects.filter(
                order=instance.id, transanction_type="Credit").count() > 0:
            pass
        else:
            balance = AccountBalance.objects.get(user=instance.user)
            balance.money = balance.money + instance.charge
            balance.save()
            OrderTransanctionModel.objects.create(user=instance.user,
                                                  order=instance,
                                                  transanction_type="Credit")


@receiver(post_save, sender=TransanctionsModel)
def update_account_balance(instance, sender, *args, **kwargs):
    if instance.status == "Approved":
        balance = AccountBalance.objects.get(user=instance.user)
        balance.money += instance.amount
        balance.save()