# Generated by Django 3.2 on 2022-02-21 22:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0013_auto_20220222_0352'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ordersmodel',
            name='remaining',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='ordersmodel',
            name='start_count',
            field=models.IntegerField(blank=True, null=True),
        ),
    ]
