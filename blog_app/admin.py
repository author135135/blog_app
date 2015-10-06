from django.contrib import admin
from blog_app import models
from blog_app.forms import MenuItemAdminForm, BlockTextAdminForm, PageAdminForm, PostAdminForm


class MenuItemInline(admin.TabularInline):
    model = models.MenuItem
    form = MenuItemAdminForm


class MenuAdmin(admin.ModelAdmin):
    list_display = ('name', 'region')
    inlines = [MenuItemInline]


class PageAdmin(admin.ModelAdmin):
    list_display = ('title', 'status', 'created_at')
    search_fields = ('title',)
    prepopulated_fields = {'slug': ('title',)}
    form = PageAdminForm
    fieldsets = (
        ('Main information', {'fields': ('title', 'slug', 'content', 'created_at', 'status')}),
        ('SEO information', {'fields': ('meta_title', 'meta_description', 'meta_keywords')})
    )

    def get_queryset(self, request):
        return models.Page.admin_objects.all()


class CategoryAdmin(admin.ModelAdmin):
    list_display = ('title', 'show_in_sidebar')
    search_fields = ('title',)
    prepopulated_fields = {'slug': ('title',)}
    fieldsets = (
        ('Main information', {'fields': ('title', 'slug', 'show_in_sidebar')}),
        ('SEO information', {'fields': ('meta_title', 'meta_description', 'meta_keywords')})
    )


class PostAdmin(admin.ModelAdmin):
    list_display = ('title', 'category', 'status', 'created_at', 'updated_at')
    search_fields = ('title',)
    prepopulated_fields = {'slug': ('title',)}
    form = PostAdminForm
    fieldsets = (
        ('Main information', {'fields': ('title', 'slug', 'content', 'category', 'main_image', 'created_at', 'status')}),
        ('SEO information', {'fields': ('meta_title', 'meta_description', 'meta_keywords')})
    )

    def get_queryset(self, request):
        return models.Post.admin_objects.all()


class BlockAdmin(admin.ModelAdmin):
    list_display = ('title', 'region', 'status')
    fieldsets = (
        ('Information', {'fields': ('title', 'region', 'pages', 'template', 'status')}),
    )

    def get_queryset(self, request):
        return models.Block.admin_objects.all()


class BlockHtmlAdmin(admin.ModelAdmin):
    form = BlockTextAdminForm


class BlockTopPostsAdmin(admin.ModelAdmin):
    pass


admin.site.register(models.Menu, MenuAdmin)
admin.site.register(models.Page, PageAdmin)
admin.site.register(models.Category, CategoryAdmin)
admin.site.register(models.Post, PostAdmin)
admin.site.register(models.Block, BlockAdmin)
admin.site.register(models.BlockHtml, BlockHtmlAdmin)
admin.site.register(models.BlockTopPosts, BlockTopPostsAdmin)
