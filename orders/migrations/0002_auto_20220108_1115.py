# Generated by Django 3.2 on 2022-01-08 05:45

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('orders', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='ordersmodel',
            options={'verbose_name': 'Order'},
        ),
        migrations.AddField(
            model_name='ordersmodel',
            name='user',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='authapp.user'),
            preserve_default=False,
        ),
    ]
