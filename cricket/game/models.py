import datetime
import requests
from django.db import models
from django.utils.html import format_html
from django_extensions.db.fields import RandomCharField
from django.db.models.query import QuerySet
from django.core.exceptions import ObjectDoesNotExist, ValidationError
from django.utils import timezone
from jsonfield import JSONField



class SoftDeletionQuerySet(QuerySet):
    def delete(self):
        return super(SoftDeletionQuerySet, self).update(deleted_at=timezone.now())

    def hard_delete(self):
        return super(SoftDeletionQuerySet, self).delete()

    def alive(self):
        return self.filter(deleted_at=None)

    def dead(self):
        return self.exclude(deleted_at=None)


class SoftDeletionManager(models.Manager):
    def __init__(self, *args, **kwargs):
        self.alive_only = kwargs.pop('alive_only', True)
        super(SoftDeletionManager, self).__init__(*args, **kwargs)

    def get_queryset(self):
        if self.alive_only:
            return SoftDeletionQuerySet(self.model).filter(deleted_at=None)
        return SoftDeletionQuerySet(self.model)

    def hard_delete(self):
        return self.get_queryset().hard_delete()


class SoftDeletionModel(models.Model):
    deleted_at = models.DateTimeField(blank=True, null=True, editable=False)

    objects = SoftDeletionManager()
    all_objects = SoftDeletionManager(alive_only=False)

    class Meta:
        abstract = True

    def delete(self):
        self.deleted_at = timezone.now()
        self.save()

    def hard_delete(self):
        super(SoftDeletionModel, self).delete()


class AmConstants(SoftDeletionModel):
    constant_type = models.CharField(max_length=255)
    value = models.IntegerField()
    label = models.CharField(max_length=255)
    is_editable = models.BooleanField(default=0)
    is_visible = models.BooleanField(default=1)
    remarks = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        app_label = 'game'
        db_table = 'am_constants'
        verbose_name = 'Constant'
        verbose_name_plural = 'constant'

    def __str__(self):
        return self.constant_type

class AmTeam(SoftDeletionModel):
    name = models.CharField(max_length=255)
    logo = models.ImageField(upload_to='teams/', blank=True, null=True)
    slug = RandomCharField(length=6, include_digits=False, unique=True)
    country = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        app_label = 'game'
        db_table = 'am_team'
        verbose_name = "Team"
        verbose_name_plural = "Team"

    def __str__(self):
        return self.name

    def image_tag(self):
        try:
            return format_html('<img src="{0}" style="max-width:200px;"/>'.format(self.logo.url))
        except requests.exceptions.HTTPError as err:
            return None
        except ValueError as err:
            return None
    image_tag.short_description = 'Image'
    image_tag.allow_tags = True




class AmPlayer(SoftDeletionModel):
    team = models.ForeignKey(AmTeam, models.DO_NOTHING, blank=True, null=True, related_name="player")
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    logo = models.ImageField(upload_to='players/', blank=True, null=True)
    slug = RandomCharField(length=6, include_digits=False, unique=True)
    jersey_number = models.IntegerField(blank=True, null=True)
    country = models.CharField(max_length=255, blank=True, null=True)
    no_of_matches = models.IntegerField(blank=True, null=True)
    runs = models.IntegerField(blank=True, null=True)
    hieghest_score = models.IntegerField(blank=True, null=True)
    fifties = models.IntegerField(blank=True, null=True)
    hundreds = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        app_label = 'game'
        db_table = 'am_player'
        verbose_name = "Player"
        verbose_name_plural = "Player"

    def __str__(self):
        return "{} - {} ({})".format(self.first_name, self.last_name, self.team.name)

    def image_tag(self):
        try:
            return format_html('<img src="{0}" style="max-width:200px;"/>'.format(self.logo.url))
        except requests.exceptions.HTTPError as err:
            return None
        except ValueError as err:
            return None
    image_tag.short_description = 'Image'
    image_tag.allow_tags = True

    def image_src(self):
        if self.logo:
            x = self.logo.url.split('?')[0]
            return x
        else:
            return ''
