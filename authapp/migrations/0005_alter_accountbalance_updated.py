# Generated by Django 3.2 on 2022-01-23 16:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authapp', '0004_alter_accountbalance_money'),
    ]

    operations = [
        migrations.AlterField(
            model_name='accountbalance',
            name='updated',
            field=models.DateTimeField(auto_now=True),
        ),
    ]
