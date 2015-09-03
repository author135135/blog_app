# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog_app', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='menuitem',
            name='sort_order',
            field=models.IntegerField(default=0, max_length=4),
        ),
        migrations.AlterField(
            model_name='menuitem',
            name='slug',
            field=models.CharField(max_length=255),
        ),
    ]
