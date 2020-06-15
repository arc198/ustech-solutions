from . import models as matchModels
from game import models as gameModels
from game.serializers import DynamicFieldsModelSerializer


class MatcheSerializer(DynamicFieldsModelSerializer):

    class Meta:
        model = matchModels.AmMatches
        exclude = ('created_at', 'updated_at')

    def to_representation(self, instance):
        data = super(MatcheSerializer, self).to_representation(instance)
        team_one = gameModels.AmTeam.objects.filter(id=data['team_one']).first()
        team_two = gameModels.AmTeam.objects.filter(id=data['team_two']).first()
        match_own = gameModels.AmTeam.objects.filter(id=data['match_own']).first()
        if team_two:
            data['team_two'] = {}
            data['team_two']['name'] = team_two.name
            data['team_two']['country'] = team_two.country
        if team_one:
            data['team_one'] = {}
            data['team_one']['name'] = team_one.name
            data['team_one']['country'] = team_one.country
        if match_own:
            data['match_own'] = {}
            data['match_own']['name'] = match_own.name
            data['match_own']['country'] = match_own.country
        return data


class PointSerializer(DynamicFieldsModelSerializer):

    class Meta:
        model = matchModels.AmPoints
        exclude = ('created_at', 'updated_at')

    def to_representation(self, instance):
        data = super(PointSerializer, self).to_representation(instance)
        match = matchModels.AmMatches.objects.filter(id=data['match']).first()
        match_own = gameModels.AmTeam.objects.filter(id=match.match_own.id).first()
        team_one = gameModels.AmTeam.objects.filter(id=match.team_one.id).first()
        team_two = gameModels.AmTeam.objects.filter(id=match.team_two.id).first()
        if match_own:
            data['winner_team'] = {}
            data['winner_team']['id'] = match_own.id
            data['winner_team']['name'] = match_own.name
            data['winner_team']['country'] = match_own.country
        if team_one:
            data['match_between'] = {}
            data['match_between']['team_one_id'] = team_one.id
            data['match_between']['team_one_name'] = team_one.name
            data['match_between']['team_one_country'] = team_one.country
        if team_two:
            data['match_between']['team_two_id'] = team_two.id
            data['match_between']['team_two_name'] = team_two.name
            data['match_between']['team_two_country'] = team_two.country
        return data