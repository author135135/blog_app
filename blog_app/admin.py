from django.contrib import admin
from blog_app import models
from blog_app.forms import MenuItemForm


class MenuItemInline(admin.TabularInline):
    model = models.MenuItem
    form = MenuItemForm


class MenuAdmin(admin.ModelAdmin):
    list_display = ['name', 'region']
    inlines = [MenuItemInline]


admin.site.register(models.Menu, MenuAdmin)

