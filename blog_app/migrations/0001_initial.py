# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Menu',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=75)),
                ('region', models.CharField(max_length=75, choices=[(b'top', b'Top menu')])),
            ],
        ),
        migrations.CreateModel(
            name='MenuItem',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=75)),
                ('slug', models.SlugField(max_length=255)),
                ('parent', models.IntegerField(null=True, blank=True)),
                ('css_class', models.CharField(max_length=100, blank=True)),
                ('menu', models.ForeignKey(to='blog_app.Menu')),
            ],
            options={
                'verbose_name_plural': 'menu items',
            },
        ),
    ]
