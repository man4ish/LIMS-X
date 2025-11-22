from rest_framework import routers
from django.urls import path, include
from .api_views import SampleViewSet, LibraryViewSet, ProjectViewSet, SampleMetadataVersionViewSet

router = routers.DefaultRouter()
router.register(r'samples', SampleViewSet)
router.register(r'libraries', LibraryViewSet)
router.register(r'projects', ProjectViewSet)

sample_versions_list = SampleMetadataVersionViewSet.as_view({'get': 'list'})
sample_versions_detail = SampleMetadataVersionViewSet.as_view({'get': 'retrieve'})

urlpatterns = [
    path('', include(router.urls)),
    path('samples/<int:sample_id>/versions/', sample_versions_list, name='sample-versions-list'),
    path('samples/<int:sample_id>/versions/<int:pk>/', sample_versions_detail, name='sample-versions-detail'),
]
