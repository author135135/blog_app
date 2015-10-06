from blog_app import models
from blog_app.forms import SearchForm


def context_data(request):
    context = dict()

    if 'admin' not in request.path:
        # Get all Block models available in this page
        blocks = list()
        for block in models.Block.objects.all():
            if block.is_allowed_in_page(request):
                blocks.append(block)

        context['blocks'] = blocks

        # Search form
        if 'query' in request.GET and request.GET['query'].strip():
            search_form = SearchForm(request.GET)
        else:
            search_form = SearchForm()

        context['search_form'] = search_form

        # Latest posts
        context['latest_posts'] = models.Post.objects.all()[:5]

    return context
