# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog_app', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='post',
            options={'ordering': ('-created_at',)},
        ),
        migrations.AlterField(
            model_name='block',
            name='region',
            field=models.CharField(max_length=100, choices=[(b'header_social', b'Header social links'), (b'header_ads', b'Header advertisement'), (b'top_posts', b'Top posts'), (b'sidebar_ads', b'Sidebar advertisement'), (b'footer_social', b'Footer social links')]),
        ),
        migrations.AlterField(
            model_name='block',
            name='template',
            field=models.CharField(max_length=100, choices=[(b'block-html-sidebar-ads.html', b'block-html-sidebar-ads.html'), (b'block-top-posts.html', b'block-top-posts.html'), (b'block-html.html', b'block-html.html')]),
        ),
        migrations.AlterField(
            model_name='category',
            name='slug',
            field=models.SlugField(unique=True, max_length=100),
        ),
    ]
