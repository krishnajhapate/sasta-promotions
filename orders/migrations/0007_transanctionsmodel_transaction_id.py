# Generated by Django 3.2 on 2022-01-08 15:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0006_auto_20220108_2056'),
    ]

    operations = [
        migrations.AddField(
            model_name='transanctionsmodel',
            name='transaction_id',
            field=models.CharField(blank=True, max_length=400, null=True),
        ),
    ]
