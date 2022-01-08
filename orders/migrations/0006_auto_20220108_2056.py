# Generated by Django 3.2 on 2022-01-08 15:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0005_alter_ordertransanctionmodel_options'),
    ]

    operations = [
        migrations.AlterField(
            model_name='transanctionsmodel',
            name='method',
            field=models.CharField(choices=[('QR', 'QR')], default='QR', max_length=20),
        ),
        migrations.AlterField(
            model_name='transanctionsmodel',
            name='status',
            field=models.CharField(choices=[('Pending', 'Pending'), ('Approved', 'Approved'), ('Cancelled', 'Cancelled'), ('Not Valid', 'Not Valid')], default='Pending', max_length=20),
        ),
        migrations.AlterField(
            model_name='transanctionsmodel',
            name='transanction_type',
            field=models.CharField(choices=[('Credit', 'Credit'), ('Debit', 'Debit')], default='Credit', max_length=20),
        ),
    ]