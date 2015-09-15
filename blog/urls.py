from django.conf.urls import include, url
from django.contrib import admin

# Remove imports in deploy
from django.conf.urls.static import static
from blog import settings
##########################################

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^ckeditor/', include('ckeditor_uploader.urls')),
    url(r'^', include('blog_app.urls', namespace='blog_app')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
