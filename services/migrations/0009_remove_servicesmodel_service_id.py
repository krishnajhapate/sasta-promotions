# Generated by Django 3.2 on 2022-01-23 17:04

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('services', '0008_auto_20220122_1942'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='servicesmodel',
            name='service_id',
        ),
    ]
