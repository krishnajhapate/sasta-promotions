# Generated by Django 3.2 on 2022-01-08 09:40

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0004_auto_20220108_1509'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='ordertransanctionmodel',
            options={'verbose_name': 'Order History'},
        ),
    ]