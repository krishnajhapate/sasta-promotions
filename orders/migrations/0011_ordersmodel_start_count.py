# Generated by Django 3.2 on 2022-01-24 15:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0010_auto_20220123_2239'),
    ]

    operations = [
        migrations.AddField(
            model_name='ordersmodel',
            name='start_count',
            field=models.IntegerField(blank=True, null=True),
        ),
    ]
