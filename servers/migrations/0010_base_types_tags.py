# -*- coding: utf-8 -*-
# Generated by Django 1.11.14 on 2018-07-05 07:26
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('servers', '0009_auto_20180705_1334'),
    ]

    operations = [
        migrations.AddField(
            model_name='base_types',
            name='tags',
            field=models.SmallIntegerField(default=12),
            preserve_default=False,
        ),
    ]