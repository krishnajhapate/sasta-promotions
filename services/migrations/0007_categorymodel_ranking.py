# Generated by Django 3.2 on 2022-01-21 14:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('services', '0006_auto_20220114_1727'),
    ]

    operations = [
        migrations.AddField(
            model_name='categorymodel',
            name='ranking',
            field=models.IntegerField(blank=True, null=True, unique=True),
        ),
    ]
