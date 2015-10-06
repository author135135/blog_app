# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog_app', '0003_auto_20150914_0027'),
    ]

    operations = [
        migrations.AlterField(
            model_name='block',
            name='status',
            field=models.CharField(default=b'public', max_length=75, choices=[(b'public', b'Public'), (b'draft', b'Draft')]),
        ),
    ]
