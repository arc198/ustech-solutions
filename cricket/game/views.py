from rest_framework import viewsets
from rest_framework.response import Response

from . import serializers as gameSerializers
from . import models as gameModels
from . import validations as validation
from . import constants as const



def check_team(request_function):

    def wrap(request, *args, **kwargs):
        team = gameModels.AmTeam.objects.filter(slug=kwargs['team_slug']).first()
        if team:
            request.kwargs['team'] = team
            return request_function(request, *args, **kwargs)
        else:
            response = {}
            response['data'] = {}
            if request.action == "list":
                response['data'] = []
            response['statusCode'] = const.INVALID_STATUS_CODE
            response['status'] = const.FAIL_STATUS
            response['message'] = "Required Team Details Invalid or Missing!"
            return Response(response)

    return wrap



class Teams(viewsets.ModelViewSet):
    serializer_class = gameSerializers.TeamSerializer

    def get_queryset(self):
        if self.request.GET.get('id'):
            return gameModels.AmTeam.objects.filter(id=self.request.GET.get('id'))
        else:
            return gameModels.AmTeam.objects.all()


    def create(self, request, *args, **kwargs):
        response = {}
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            self.perform_create(serializer)
            response["data"] = serializer.data
            response['statusCode'] = const.SUCCESS_STATUS_CODE
            response['status'] = const.SUCCESS_STATUS
            response['message'] = "Team Created Successfully"
        else:
            response['message'] = validation.error_message(serializer).data["message"]
            response['data'] = {}
            response['statusCode'] = const.INVALID_STATUS_CODE
            response['status'] = const.FAIL_STATUS

        return Response(response)


    def list(self, request, *args, **kwargs):
        response = {}
        queryset = self.filter_queryset(self.get_queryset())
        serializer = self.get_serializer(queryset, many=True)
        if len(serializer.data) > 0:
            response["data"] = serializer.data
            response['message'] = "Fetched Team Details Successfully"
        else:
            response["data"] = []
            response['message'] = "No Team Available"

        response['statusCode'] = const.SUCCESS_STATUS_CODE
        response['status'] = const.SUCCESS_STATUS
        return Response(response)


    def retrieve(self, request, *args, **kwargs):
        response = {}
        if gameModels.AmTeam.objects.filter(id=self.kwargs['pk']).exists():
            instance = self.get_object()
            serializer = self.get_serializer(instance)
            response["data"] = serializer.data
            response['statusCode'] = const.SUCCESS_STATUS_CODE
            response['status'] = const.SUCCESS_STATUS
            response['message'] = "Fetched Team Details Successfully"
        else:
            response["data"] = {}
            response['status'] = const.FAIL_STATUS
            response['statusCode'] = const.INVALID_STATUS_CODE
            response['message'] = "Requested Team Details are not valid"
        return Response(response)

    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', True)
        response = {}
        response['data'] = {}
        if gameModels.AmTeam.objects.filter(id=self.kwargs['pk']).exists():
            instance = self.get_object()
            serializer = self.get_serializer(instance, partial=partial, data=request.data)
            if serializer.is_valid():
                self.perform_update(serializer)
                response['data'].update(serializer.data)
                response['statusCode'] = const.SUCCESS_STATUS_CODE
                response['status'] = const.SUCCESS_STATUS
                response['message'] = "Updated Team Details Successfully"
                return Response(response)
            else:
                response['statusCode'] = const.INVALID_STATUS_CODE
                response['status'] = const.FAIL_STATUS
                response['message'] = validation.error_message(serializer).data["message"]
        return Response(response)

    def destroy(self, request, *args, **kwargs):
        response = {}
        if gameModels.AmTeam.objects.filter(id=self.kwargs['pk']).exists():
            instance = self.get_object()
            self.perform_destroy(instance)
            response["data"] = {}
            response['statusCode'] = const.SUCCESS_STATUS_CODE
            response['status'] = const.SUCCESS_STATUS
            response['message'] = "Deleted Team Successfully"
        else:
            response['data'] = {}
            response['statusCode'] = const.INVALID_STATUS_CODE
            response['status'] = const.FAIL_STATUS
            response['message'] = "Requested Team Details is not valid"
        return Response(response)




class Playears(viewsets.ModelViewSet):
    serializer_class = gameSerializers.PlayerSerializer

    def get_queryset(self):
        if self.request.GET.get('id'):
            return gameModels.AmPlayer.objects.filter(id=self.request.GET.get('id'), team__slug=self.kwargs['team_slug'])
        elif self.kwargs['team_slug']:
            return gameModels.AmPlayer.objects.filter(team__slug=self.kwargs['team_slug'])
        else:
            return gameModels.AmPlayer.objects.none()

    @check_team
    def create(self, request, *args, **kwargs):
        response = {}
        request.data['team'] = self.kwargs['team'].id
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            self.perform_create(serializer)
            response["data"] = serializer.data
            response['statusCode'] = const.SUCCESS_STATUS_CODE
            response['status'] = const.SUCCESS_STATUS
            response['message'] = "Player Details Created Successfully"
        else:
            response['message'] = validation.error_message(serializer).data["message"]
            response['data'] = {}
            response['statusCode'] = const.INVALID_STATUS_CODE
            response['status'] = const.FAIL_STATUS

        return Response(response)

    @check_team
    def list(self, request, *args, **kwargs):
        response = {}
        queryset = self.filter_queryset(self.get_queryset())
        serializer = self.get_serializer(queryset, many=True)
        if len(serializer.data) > 0:
            response["data"] = serializer.data
            response['message'] = "Fetched Player Details Successfully"
        else:
            response["data"] = []
            response['message'] = "No Player Available"

        response['statusCode'] = const.SUCCESS_STATUS_CODE
        response['status'] = const.SUCCESS_STATUS
        return Response(response)

    @check_team
    def retrieve(self, request, *args, **kwargs):
        response = {}
        if gameModels.AmPlayer.objects.filter(id=self.kwargs['pk'],team__slug=self.kwargs['team_slug']).exists():
            instance = self.get_object()
            serializer = self.get_serializer(instance)
            response["data"] = serializer.data
            response['statusCode'] = const.SUCCESS_STATUS_CODE
            response['status'] = const.SUCCESS_STATUS
            response['message'] = "Fetched Player Details Successfully"
        else:
            response["data"] = {}
            response['status'] = const.FAIL_STATUS
            response['statusCode'] = const.INVALID_STATUS_CODE
            response['message'] = "Requested Player Details are not valid"
        return Response(response)

    @check_team
    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', True)
        response = {}
        response['data'] = {}
        if gameModels.AmPlayer.objects.filter(id=self.kwargs['pk'],team__slug=self.kwargs['team_slug']).exists():
            instance = self.get_object()
            serializer = self.get_serializer(instance, partial=partial, data=request.data)
            if serializer.is_valid():
                self.perform_update(serializer)
                response['data'].update(serializer.data)
                response['statusCode'] = const.SUCCESS_STATUS_CODE
                response['status'] = const.SUCCESS_STATUS
                response['message'] = "Updated Player Details Successfully"
                return Response(response)
            else:
                response['statusCode'] = const.INVALID_STATUS_CODE
                response['status'] = const.FAIL_STATUS
                response['message'] = validation.error_message(serializer).data["message"]
        return Response(response)

    @check_team
    def destroy(self, request, *args, **kwargs):
        response = {}
        if gameModels.AmPlayer.objects.filter(id=self.kwargs['pk'],team__slug=self.kwargs['team_slug']).exists():
            instance = self.get_object()
            self.perform_destroy(instance)
            response["data"] = {}
            response['statusCode'] = const.SUCCESS_STATUS_CODE
            response['status'] = const.SUCCESS_STATUS
            response['message'] = "Deleted Player Successfully"
        else:
            response['data'] = {}
            response['statusCode'] = const.INVALID_STATUS_CODE
            response['status'] = const.FAIL_STATUS
            response['message'] = "Requested Player Details is not valid"
        return Response(response)
