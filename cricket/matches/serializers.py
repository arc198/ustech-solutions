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

