# Generated by Django 3.2 on 2022-02-28 10:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0012_settings_site_title'),
    ]

    operations = [
        migrations.AddField(
            model_name='settings',
            name='whatsapp_message',
            field=models.CharField(blank=True, max_length=400, null=True),
        ),
    ]
