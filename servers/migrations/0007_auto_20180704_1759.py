# -*- coding: utf-8 -*-
# Generated by Django 1.11.14 on 2018-07-04 09:59
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('servers', '0006_auto_20180704_1723'),
    ]

    operations = [
        migrations.AlterField(
            model_name='configurations',
            name='motherboard',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, related_name='motherboard', to='servers.hardware_accessories'),
        ),
    ]