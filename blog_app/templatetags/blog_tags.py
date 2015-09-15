import os
from django import template
from django.template.loader import get_template
from blog_app import models


register = template.Library()


@register.inclusion_tag(file_name='tags/menu.html')
def menu(region=None):
    if region is None:
        raise template.TemplateSyntaxError("Parameter `region` must be a valid menu position string, not None")

    try:
        menu_items = models.MenuItem.objects.select_related('menu').filter(menu__region=region)
    except models.Menu.DoesNotExist:
        menu_items = None

    result = {}

    if menu_items:
        result['menu_id'] = ''
        result['items'] = []

        for item in filter(lambda i: i.parent is None, menu_items):
            if not result['menu_id']:
                result['menu_id'] = item.menu.region

            children = filter(lambda i: i.parent == item.pk, menu_items)
            children_items = []

            for child in children:
                children_items.append({
                    'title': child.title,
                    'slug': child.slug,
                    'class': child.css_class,
                })

            result['items'].append({
                'title': item.title,
                'slug': item.slug,
                'class': item.css_class,
                'children': children_items,
            })

    return {
        'menu': result
    }


@register.inclusion_tag(file_name='tags/sidebar_content.html')
def sidebar_content():
    category = None
    posts = None

    try:
        category = models.Category.objects.get(show_in_sidebar=2)
    except models.Category.DoesNotExist:
        pass

    if category:
        posts = models.Post.public_posts.filter(category=category)[:4]

    return {
        'category': category,
        'posts': posts,
    }


@register.simple_tag(takes_context=True,)
def region(context, region_name=None, *args, **kwargs):
    if region is None:
        raise template.TemplateSyntaxError("Parameter `region` must be a valid block position string, not None")

    blocks = context['blocks']
    output = ''

    for block in blocks:
        if block.region == region_name:
            block_template = get_template(template_name=os.path.join('blocks', block.template))
            output += block_template.render({
                'block': block,
            })

    return output

