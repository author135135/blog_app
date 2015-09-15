import os
from django.db import models
from django.utils import timezone
from django.conf import settings
from django.core.urlresolvers import reverse


class Menu(models.Model):
    name = models.CharField(max_length=75)
    region = models.CharField(max_length=75, choices=settings.BLOG_MENU_POSITIONS)

    def __unicode__(self):
        return self.name


class MenuItem(models.Model):
    menu = models.ForeignKey(to=Menu)
    title = models.CharField(max_length=75)
    slug = models.CharField(max_length=255)
    parent = models.IntegerField(blank=True, null=True)
    sort_order = models.IntegerField(default=0)
    css_class = models.CharField(max_length=100, blank=True)

    class Meta:
        verbose_name_plural = 'menu items'
        ordering = ['sort_order']

    def __unicode__(self):
        return self.title


class SeoInformation(models.Model):
    meta_title = models.CharField(max_length=100, blank=True, null=True)
    meta_description = models.TextField(blank=True, null=True)
    meta_keywords = models.TextField(blank=True, null=True)

    class Meta:
        abstract = True

CONTENT_STATUS = (
    ('public', 'Public'),
    ('draft', 'Draft'),
)


class PagePublicManager(models.Manager):
    def get_queryset(self):
        return super(PagePublicManager, self).get_queryset().filter(status='public')


class Page(SeoInformation):
    title = models.CharField(max_length=255)
    slug = models.SlugField(max_length=255, unique=True)
    content = models.TextField()
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(auto_now=True)
    status = models.CharField(max_length=75, choices=CONTENT_STATUS, default='public')

    objects = models.Manager()
    public_pages = PagePublicManager()

    def __unicode__(self):
        return self.title


class Category(SeoInformation):
    title = models.CharField(max_length=100)
    slug = models.SlugField(max_length=100, unique=True)
    show_in_sidebar = models.NullBooleanField()

    class Meta:
        verbose_name_plural = 'categories'

    def __unicode__(self):
        return self.title


class PostManager(models.Manager):
    use_for_related_fields = True

    def get_queryset(self):
        return super(PostManager, self).get_queryset().select_related('category')


class PostPublicManager(PostManager):
    def get_queryset(self):
        return super(PostPublicManager, self).get_queryset().filter(status='public')


class Post(SeoInformation):
    category = models.ForeignKey(to=Category)
    title = models.CharField(max_length=255)
    slug = models.SlugField(max_length=255, unique=True)
    content = models.TextField()
    main_image = models.ImageField(max_length=150, upload_to='posts')
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(auto_now=True)
    status = models.CharField(max_length=75, choices=CONTENT_STATUS, default='public')

    objects = PostManager()
    public_posts = PostPublicManager()

    class Meta:
        ordering = ('-created_at',)

    def __unicode__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('blog_app:post', kwargs={'category_slug': self.category.slug, 'post_slug': self.slug})

    def get_public_posts(self):
        return self.objects.filter(status='public')


class Block(models.Model):
    BLOCK_TEMPLATES = [(t, t) for t in os.listdir(os.path.join(settings.BASE_DIR, 'blog_app/templates/blocks'))]
    BLOCK_STATUS = (
        (0, 'Disabled'),
        (1, 'Enabled'),
    )

    title = models.CharField(max_length=75)
    region = models.CharField(max_length=100, choices=settings.BLOG_BLOCK_REGIONS)
    pages = models.TextField(default='*', help_text='Enter page url one per line')
    template = models.CharField(max_length=100, choices=BLOCK_TEMPLATES)
    status = models.SmallIntegerField(choices=BLOCK_STATUS)

    def __unicode__(self):
        return self.title


class BlockHtml(models.Model):
    block = models.OneToOneField(to=Block, related_name='block_html')
    content = models.TextField()

    class Meta:
        verbose_name = 'Html block'
        verbose_name_plural = 'Html blocks'

    def __unicode__(self):
        return self.block.title


class BlockTopPosts(models.Model):
    block = models.OneToOneField(to=Block, related_name='block_top_posts')
    main_post = models.ForeignKey(to=Post, related_name='main_post')
    posts = models.ManyToManyField(to=Post, related_name='posts')

    class Meta:
        verbose_name_plural = 'Top posts blocks'

    def __unicode__(self):
        return self.block.title

    def is_active(self):
        return self.main_post.status == 'public'
