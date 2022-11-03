# Generated by Django 3.2.9 on 2022-11-03 19:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0019_alter_tutorials_options'),
    ]

    operations = [
        migrations.AddField(
            model_name='settings',
            name='promotional_description',
            field=models.CharField(default='', max_length=1000),
        ),
        migrations.AddField(
            model_name='settings',
            name='promotional_image',
            field=models.ImageField(blank=True, null=True, upload_to='image'),
        ),
    ]