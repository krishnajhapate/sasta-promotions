# Generated by Django 3.2 on 2022-02-21 22:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0011_ordersmodel_start_count'),
    ]

    operations = [
        migrations.AddField(
            model_name='ordersmodel',
            name='remaining',
            field=models.IntegerField(blank=True, null=True),
        ),
    ]
