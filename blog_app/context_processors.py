from blog_app import models
from blog_app.forms import SearchForm


def context_data(request):
    context = dict()

    # Get all Block models available in this page
    blocks = list()
    for block in models.Block.objects.filter(status=1).prefetch_related('block_html', 'block_top_posts'):
        allowed_pages = block.pages.split("\n")
        if '*' in allowed_pages or request.path in allowed_pages:
            blocks.append(block)

    context['blocks'] = blocks

    # Search form
    if 'query' in request.GET and request.GET['query'].strip():
        search_form = SearchForm(request.GET)
    else:
        search_form = SearchForm()

    context['search_form'] = search_form

    # Latest posts
    context['latest_posts'] = models.Post.public_posts.all()[:5]

    return context
