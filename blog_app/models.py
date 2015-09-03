from django.db import models


class Menu(models.Model):
    MENU_POSITIONS = (
        ('top', 'Top menu'),
    )

    name = models.CharField(max_length=75)
    region = models.CharField(max_length=75, choices=MENU_POSITIONS)

    def __unicode__(self):
        return self.name


class MenuItem(models.Model):
    menu = models.ForeignKey(to=Menu)
    title = models.CharField(max_length=75)
    slug = models.CharField(max_length=255)
    parent = models.IntegerField(blank=True, null=True)
    sort_order = models.IntegerField(default=0)
    css_class = models.CharField(max_length=100, blank=True)

    class Meta:
        verbose_name_plural = 'menu items'

    def __unicode__(self):
        return self.title
