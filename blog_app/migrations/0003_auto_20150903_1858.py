# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog_app', '0002_auto_20150903_1857'),
    ]

    operations = [
        migrations.AlterField(
            model_name='menuitem',
            name='sort_order',
            field=models.IntegerField(default=0),
        ),
    ]
