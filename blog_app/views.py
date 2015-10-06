from django.http import Http404
from django.views.generic import DetailView, TemplateView, ListView
from blog_app import models


# Pages CBV
class FrontPageView(TemplateView):
    template_name = 'blog_app/index.html'

    def get_context_data(self, **kwargs):
        context = super(FrontPageView, self).get_context_data(**kwargs)

        # Get all categories
        categories = models.Category.objects.prefetch_related('post_set').all()
        context['categories'] = categories

        return context


class CategoryPageView(DetailView):
    template_name = 'blog_app/category.html'
    model = models.Category


class PostPageView(DetailView):
    template_name = 'blog_app/post.html'
    model = models.Post
    slug_url_kwarg = 'post_slug'

    def get_context_data(self, **kwargs):
        context = super(PostPageView, self).get_context_data(**kwargs)
        context['related_posts'] = models.Post.objects.filter(category=self.object.category.pk).order_by(
            '?').exclude(pk=self.object.pk)[:3]

        return context


class InformationPageView(DetailView):
    template_name = 'blog_app/information.html'
    model = models.Page


class SearchPageView(ListView):
    template_name = 'blog_app/search.html'
    model = models.Post
    context_object_name = 'posts'

    def get_queryset(self):
        qs = super(SearchPageView, self).get_queryset()

        if 'query' in self.request.GET and self.request.GET['query'].strip():
            query = self.request.GET['query']
            qs = qs.filter(title__icontains=query)
        else:
            qs = qs.none()

        return qs


# Routing function which search category/page by slug.
# Return specific CBV or raise 404
def router(request, slug):
    try:
        category = CategoryPageView.as_view()(request, slug=slug)
    except Http404:
        pass
    else:
        return category

    try:
        page = InformationPageView.as_view()(request, slug=slug)
    except Http404:
        pass
    else:
        return page

    raise Http404
