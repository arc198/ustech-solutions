from django.urls import path
from django.conf.urls import include, re_path
from . import views as matchviews
from rest_framework import routers
from django.conf import settings
from django.conf.urls.static import static



router = routers.DefaultRouter()

urlpatterns = router.urls

urlpatterns += [

    # CRUD operation urls for Match details.

    path('create_match/', matchviews.Matches.as_view({'post': 'create','get': 'list'})),
    path('update_match/<pk>/', matchviews.Matches.as_view({'put': 'update', 'delete': 'destroy'})),


    # CRUD operation urls for Points details.
    path('<match_slug>/create_points/', matchviews.Points.as_view({'post': 'create'})),
    path('list_points/', matchviews.Points.as_view({'get': 'list'})),
    path('update_points/<pk>/', matchviews.Points.as_view({'put': 'update', 'delete': 'destroy'})),




]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
