# Generated by Django 3.2 on 2021-12-31 03:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('services', '0002_auto_20211231_0317'),
    ]

    operations = [
        migrations.AlterField(
            model_name='servicesmodel',
            name='service_id',
            field=models.IntegerField(blank=True, null=True),
        ),
    ]
