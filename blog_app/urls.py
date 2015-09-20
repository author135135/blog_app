from django.conf.urls import url, include
from blog_app import views


urlpatterns = [
    url(r'^$', views.FrontPageView.as_view(), name='index'),
    url(r'^search/', views.SearchPageView.as_view(), name='search'),
    url(r'^(?P<slug>[\w-]+)/$', views.router),
    url(r'^(?P<category_slug>[\w-]+)/(?P<post_slug>[\w-]+)/$', views.PostPageView.as_view(), name='post'),
]
