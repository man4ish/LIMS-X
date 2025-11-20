from rest_framework import routers
from django.urls import path, include
from .api_views import SampleViewSet, LibraryViewSet, ProjectViewSet

router = routers.DefaultRouter()
router.register(r'samples', SampleViewSet)
router.register(r'libraries', LibraryViewSet)
router.register(r'projects', ProjectViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
