from django.urls import path
from django.conf.urls import include, re_path
from . import views as gameviews
from rest_framework import routers
from django.conf import settings
from django.conf.urls.static import static



router = routers.DefaultRouter()

# CRUD operation url for Player details.

router.register(prefix=r'(?P<team_slug>.+)/playear_details', viewset=gameviews.Playears, basename="playear_details")


urlpatterns = router.urls

urlpatterns += [

    # CRUD operation urls for Team details.

    path('create_team/', gameviews.Teams.as_view({'get': 'list', 'post': 'create'})),
    path('update_team/<pk>/', gameviews.Teams.as_view({'put': 'update', 'delete': 'destroy'})),



]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
