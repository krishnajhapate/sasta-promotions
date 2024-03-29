# Generated by Django 3.2 on 2022-06-10 17:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0014_remove_settings_favicon'),
    ]

    operations = [
        migrations.AddField(
            model_name='settings',
            name='paytm_merchant_id',
            field=models.CharField(blank=True, max_length=300, null=True),
        ),
        migrations.AddField(
            model_name='settings',
            name='paytmqr_active',
            field=models.BooleanField(default=False),
        ),
    ]
