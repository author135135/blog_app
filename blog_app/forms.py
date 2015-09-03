from django import forms
from blog_app import models


# Admin forms

# MenuItemForm add dynamic choices to default model form
class MenuItemForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(MenuItemForm, self).__init__(*args, **kwargs)
        self.fields['parent'].widget = forms.Select(choices=self._choices)

    def _get_choices(self):
        choices = [('', '---------')]
        queryset = models.MenuItem.objects.values_list('id', 'title')
        if self.instance.pk is not None:
            queryset = queryset.exclude(pk=self.instance.pk)
        return choices + list(queryset)
    _choices = property(_get_choices)
