# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Block',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=75)),
                ('region', models.CharField(max_length=100, choices=[(b'header_social', b'Header social links'), (b'header_ads', b'Header advertisement'), (b'top_posts', b'Top posts'), (b'footer_social', b'Footer social links')])),
                ('pages', models.TextField(default=b'*', help_text=b'Enter page url one per line')),
                ('template', models.CharField(max_length=100, choices=[(b'block-top-posts.html', b'block-top-posts.html'), (b'block-html.html', b'block-html.html')])),
                ('status', models.SmallIntegerField(choices=[(0, b'Disabled'), (1, b'Enabled')])),
            ],
        ),
        migrations.CreateModel(
            name='BlockHtml',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('content', models.TextField()),
                ('block', models.OneToOneField(related_name='block_html', to='blog_app.Block')),
            ],
            options={
                'verbose_name': 'Html block',
                'verbose_name_plural': 'Html blocks',
            },
        ),
        migrations.CreateModel(
            name='BlockTopPosts',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('block', models.OneToOneField(related_name='block_top_posts', to='blog_app.Block')),
            ],
            options={
                'verbose_name_plural': 'Top posts blocks',
            },
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('meta_title', models.CharField(max_length=100, null=True, blank=True)),
                ('meta_description', models.TextField(null=True, blank=True)),
                ('meta_keywords', models.TextField(null=True, blank=True)),
                ('title', models.CharField(max_length=100)),
                ('slug', models.SlugField(max_length=100)),
                ('show_in_sidebar', models.NullBooleanField()),
            ],
            options={
                'verbose_name_plural': 'categories',
            },
        ),
        migrations.CreateModel(
            name='Menu',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=75)),
                ('region', models.CharField(max_length=75, choices=[(b'menu-primary', b'Top menu')])),
            ],
        ),
        migrations.CreateModel(
            name='MenuItem',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=75)),
                ('slug', models.CharField(max_length=255)),
                ('parent', models.IntegerField(null=True, blank=True)),
                ('sort_order', models.IntegerField(default=0)),
                ('css_class', models.CharField(max_length=100, blank=True)),
                ('menu', models.ForeignKey(to='blog_app.Menu')),
            ],
            options={
                'ordering': ['sort_order'],
                'verbose_name_plural': 'menu items',
            },
        ),
        migrations.CreateModel(
            name='Page',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('meta_title', models.CharField(max_length=100, null=True, blank=True)),
                ('meta_description', models.TextField(null=True, blank=True)),
                ('meta_keywords', models.TextField(null=True, blank=True)),
                ('title', models.CharField(max_length=255)),
                ('slug', models.SlugField(max_length=255)),
                ('content', models.TextField()),
                ('created_at', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('status', models.CharField(default=b'public', max_length=75, choices=[(b'public', b'Public'), (b'draft', b'Draft')])),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('meta_title', models.CharField(max_length=100, null=True, blank=True)),
                ('meta_description', models.TextField(null=True, blank=True)),
                ('meta_keywords', models.TextField(null=True, blank=True)),
                ('title', models.CharField(max_length=255)),
                ('slug', models.SlugField(max_length=255)),
                ('content', models.TextField()),
                ('main_image', models.ImageField(max_length=150, upload_to=b'posts')),
                ('created_at', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('status', models.CharField(default=b'public', max_length=75, choices=[(b'public', b'Public'), (b'draft', b'Draft')])),
                ('category', models.ForeignKey(to='blog_app.Category')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AddField(
            model_name='blocktopposts',
            name='main_post',
            field=models.ForeignKey(related_name='main_post', to='blog_app.Post'),
        ),
        migrations.AddField(
            model_name='blocktopposts',
            name='posts',
            field=models.ManyToManyField(related_name='posts', to='blog_app.Post'),
        ),
    ]
