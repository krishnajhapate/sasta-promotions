# Generated by Django 3.2 on 2022-03-03 06:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('services', '0016_rename_is_refill_servicesmodel_refill'),
    ]

    operations = [
        migrations.AddField(
            model_name='offers',
            name='offer_type',
            field=models.CharField(choices=[('Percentage', 'Percentage'), ('Price', 'Price')], default='Price', max_length=20),
        ),
    ]
