# Generated by Django 3.2 on 2022-02-21 21:42

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('services', '0015_offers'),
    ]

    operations = [
        migrations.RenameField(
            model_name='servicesmodel',
            old_name='is_refill',
            new_name='refill',
        ),
    ]
