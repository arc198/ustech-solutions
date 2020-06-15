from django.db import models
from django_extensions.db.fields import RandomCharField
from game import models as gameModels


class AmMatches(gameModels.SoftDeletionModel):
    team_one = models.ForeignKey(gameModels.AmTeam, models.DO_NOTHING, blank=True, null=True, related_name="first_team")
    team_two = models.ForeignKey(gameModels.AmTeam, models.DO_NOTHING, blank=True, null=True, related_name="second_team")
    slug = RandomCharField(length=6, include_digits=False, unique=True)
    match_own = models.ForeignKey(gameModels.AmTeam, models.DO_NOTHING, blank=True, null=True, related_name="match_winner")
    created_at = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        app_label = 'matches'
        db_table = 'am_matches'
        verbose_name = "Matches"
        verbose_name_plural = "Matches"

    def __str__(self):
        return self.match_own.name


#for enhancement purpose of multi random winning calculation

class AmPoints(gameModels.SoftDeletionModel):
    team = models.ForeignKey(gameModels.AmTeam, models.DO_NOTHING, blank=True, null=True, related_name="points_own")
    match = models.ForeignKey(AmMatches, models.DO_NOTHING, blank=True, null=True, related_name="matches_between")
    points = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        app_label = 'matches'
        db_table = 'am_points'
        verbose_name = "Points"
        verbose_name_plural = "Points"

    def __str__(self):
        return self.match