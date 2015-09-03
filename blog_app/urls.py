from django.conf.urls import url

urlpatterns = [
    url(r'^$', 'blog_app.views.index'),
]
