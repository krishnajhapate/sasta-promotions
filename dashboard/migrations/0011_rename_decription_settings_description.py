# Generated by Django 3.2 on 2022-02-28 10:38

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0010_alter_settings_favicon'),
    ]

    operations = [
        migrations.RenameField(
            model_name='settings',
            old_name='decription',
            new_name='description',
        ),
    ]
