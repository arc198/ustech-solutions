from rest_framework import viewsets
from rest_framework.response import Response
from . import serializers as matchSerializers
from game import models as gameModels
from . import models as matchModels
from game import validations as validation
from game import constants as const





def check_team(request_function):

    def wrap(request, *args, **kwargs):
        team_one = gameModels.AmTeam.objects.filter(slug=kwargs['team_one']).first()
        team_two = gameModels.AmTeam.objects.filter(slug=kwargs['team_two']).first()
        if team_one and team_two:
            request.kwargs['team_one'] = team_one
            request.kwargs['team_two'] = team_two
            return request_function(request, *args, **kwargs)
        else:
            response = {}
            response['data'] = {}
            if request.action == "list":
                response['data'] = []
            response['statusCode'] = const.INVALID_STATUS_CODE
            response['status'] = const.FAIL_STATUS
            response['message'] = "Required Teams Details Invalid or Missing!"
            return Response(response)

    return wrap



class Matches(viewsets.ModelViewSet):
    serializer_class = matchSerializers.MatcheSerializer

    def get_queryset(self):
        if self.request.GET.get('id'):
            return matchModels.AmMatches.objects.filter(id=self.request.GET.get('id'))
        else:
            return matchModels.AmMatches.objects.all()

    def create(self, request, *args, **kwargs):
        response = {}
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            self.perform_create(serializer)
            response["data"] = serializer.data
            response['statusCode'] = const.SUCCESS_STATUS_CODE
            response['status'] = const.SUCCESS_STATUS
            response['message'] = "Match Details Created Successfully"
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
            response['message'] = "Match Details Successfully"
        else:
            response["data"] = []
            response['message'] = "No Match Available"

        response['statusCode'] = const.SUCCESS_STATUS_CODE
        response['status'] = const.SUCCESS_STATUS
        return Response(response)

    def retrieve(self, request, *args, **kwargs):
        response = {}
        if matchModels.AmMatches.objects.filter(id=self.kwargs['pk'],slug=self.kwargs['match_slug']).exists():
            instance = self.get_object()
            serializer = self.get_serializer(instance)
            response["data"] = serializer.data
            response['statusCode'] = const.SUCCESS_STATUS_CODE
            response['status'] = const.SUCCESS_STATUS
            response['message'] = "Fetched Match Details Successfully"
        else:
            response["data"] = {}
            response['status'] = const.FAIL_STATUS
            response['statusCode'] = const.INVALID_STATUS_CODE
            response['message'] = "Requested Match Details are not valid"
        return Response(response)


    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', True)
        response = {}
        response['data'] = {}
        if matchModels.AmMatches.objects.filter(id=self.kwargs['pk']).exists():
            instance = self.get_object()
            serializer = self.get_serializer(instance, partial=partial, data=request.data)
            if serializer.is_valid():
                self.perform_update(serializer)
                response['data'].update(serializer.data)
                response['statusCode'] = const.SUCCESS_STATUS_CODE
                response['status'] = const.SUCCESS_STATUS
                response['message'] = "Updated Match Details Successfully"
                return Response(response)
            else:
                response['statusCode'] = const.INVALID_STATUS_CODE
                response['status'] = const.FAIL_STATUS
                response['message'] = validation.error_message(serializer).data["message"]
        return Response(response)


    def destroy(self, request, *args, **kwargs):
        response = {}
        if matchModels.AmMatches.objects.filter(id=self.kwargs['pk']).exists():
            instance = self.get_object()
            self.perform_destroy(instance)
            response["data"] = {}
            response['statusCode'] = const.SUCCESS_STATUS_CODE
            response['status'] = const.SUCCESS_STATUS
            response['message'] = "Deleted Match Successfully"
        else:
            response['data'] = {}
            response['statusCode'] = const.INVALID_STATUS_CODE
            response['status'] = const.FAIL_STATUS
            response['message'] = "Requested Match Details is not valid"
        return Response(response)


def check_match(request_function):

    def wrap(request, *args, **kwargs):
        match = matchModels.AmMatches.objects.filter(slug=kwargs['match_slug']).first()
        if match:
            request.kwargs['match'] = match
            return request_function(request, *args, **kwargs)
        else:
            response = {}
            response['data'] = {}
            if request.action == "list":
                response['data'] = []
            response['statusCode'] = const.INVALID_STATUS_CODE
            response['status'] = const.FAIL_STATUS
            response['message'] = "Required Match Details Invalid or Missing!"
            return Response(response)

    return wrap



class Points(viewsets.ModelViewSet):
    serializer_class = matchSerializers.PointSerializer

    def get_queryset(self):
        if self.request.GET.get('id'):
            return matchModels.AmPoints.objects.filter(id=self.request.GET.get('id'))
        else:
            return matchModels.AmPoints.objects.all()

    @check_match
    def create(self, request, *args, **kwargs):
        response = {}
        request.data['match'] = self.kwargs['match'].id
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            self.perform_create(serializer)
            response["data"] = serializer.data
            response['statusCode'] = const.SUCCESS_STATUS_CODE
            response['status'] = const.SUCCESS_STATUS
            response['message'] = "Points Details Created Successfully"
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
            response['message'] = "Points Details Successfully"
        else:
            response["data"] = []
            response['message'] = "No Points Details Available"

        response['statusCode'] = const.SUCCESS_STATUS_CODE
        response['status'] = const.SUCCESS_STATUS
        return Response(response)

    def retrieve(self, request, *args, **kwargs):
        response = {}
        if matchModels.AmPoints.objects.filter(id=self.kwargs['pk'], match_slug=self.kwargs['match_slug']).exists():
            instance = self.get_object()
            serializer = self.get_serializer(instance)
            response["data"] = serializer.data
            response['statusCode'] = const.SUCCESS_STATUS_CODE
            response['status'] = const.SUCCESS_STATUS
            response['message'] = "Fetched Match Details Successfully"
        else:
            response["data"] = {}
            response['status'] = const.FAIL_STATUS
            response['statusCode'] = const.INVALID_STATUS_CODE
            response['message'] = "Requested Match Points Details are not valid"
        return Response(response)


    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', True)
        response = {}
        response['data'] = {}
        if matchModels.AmPoints.objects.filter(id=self.kwargs['pk']).exists():
            instance = self.get_object()
            serializer = self.get_serializer(instance, partial=partial, data=request.data)
            if serializer.is_valid():
                self.perform_update(serializer)
                response['data'].update(serializer.data)
                response['statusCode'] = const.SUCCESS_STATUS_CODE
                response['status'] = const.SUCCESS_STATUS
                response['message'] = "Updated Team Points Details Successfully"
                return Response(response)
            else:
                response['statusCode'] = const.INVALID_STATUS_CODE
                response['status'] = const.FAIL_STATUS
                response['message'] = validation.error_message(serializer).data["message"]
        return Response(response)


    def destroy(self, request, *args, **kwargs):
        response = {}
        if matchModels.AmPoints.objects.filter(id=self.kwargs['pk']).exists():
            instance = self.get_object()
            self.perform_destroy(instance)
            response["data"] = {}
            response['statusCode'] = const.SUCCESS_STATUS_CODE
            response['status'] = const.SUCCESS_STATUS
            response['message'] = "Deleted Team Points Successfully"
        else:
            response['data'] = {}
            response['statusCode'] = const.INVALID_STATUS_CODE
            response['status'] = const.FAIL_STATUS
            response['message'] = "Requested Team Points Details is not valid"
        return Response(response)
