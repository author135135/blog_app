# coding: utf-8
from django import forms
from blog_app import models
from ckeditor_uploader.widgets import CKEditorUploadingWidget as CKEditorWidget


# Frontend forms

# Search form
class SearchForm(forms.Form):
    query = forms.CharField(widget=forms.TextInput(attrs={'placeholder': u'Поиск', 'class': 's field'}))


# Admin forms

# MenuItemForm add dynamic choices to default model form
class MenuItemAdminForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(MenuItemAdminForm, self).__init__(*args, **kwargs)
        self.fields['parent'].widget = forms.Select(choices=self._choices)

    def _get_choices(self):
        choices = [('', '---------')]
        queryset = models.MenuItem.objects.values_list('id', 'title')
        if self.instance.pk is not None:
            queryset = queryset.exclude(pk=self.instance.pk)
        return choices + list(queryset)
    _choices = property(_get_choices)


# Override default filed widget to use CKEditor widget
class PageAdminForm(forms.ModelForm):
    content = forms.CharField(widget=CKEditorWidget)


class PostAdminForm(forms.ModelForm):
    content = forms.CharField(widget=CKEditorWidget)


class BlockTextAdminForm(forms.ModelForm):
    content = forms.CharField(widget=CKEditorWidget)
