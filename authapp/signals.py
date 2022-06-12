from django.dispatch import receiver
from django.db.models.signals import post_save
import requests
from authapp.models import AccountBalance
from orders.models import *
from services.models import ServicesModel


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
                        instance.save()
                    else:
                        pass
                except:
                    pass

    if instance.status == "Cancelled":
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


@receiver(post_save, sender=User)
def create_wallet(instance, sender, created, *args, **kwargs):

    if created:
        AccountBalance.objects.create(user=instance)
