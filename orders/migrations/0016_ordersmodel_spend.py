# Generated by Django 3.2.9 on 2022-10-03 11:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0015_rename_remaining_ordersmodel_remains'),
    ]

    operations = [
        migrations.AddField(
            model_name='ordersmodel',
            name='spend',
            field=models.FloatField(blank=True, null=True),
        ),
    ]
