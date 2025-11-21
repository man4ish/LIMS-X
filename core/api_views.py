from rest_framework import viewsets, serializers
from rest_framework.permissions import IsAuthenticated
from core.models import Sample, Library, Project
from core.permissions import IsTechnicianOrAdmin, IsAdmin, IsAdminOrPI

# -------------------------
# Serializers
# -------------------------
class SampleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sample
        fields = '__all__'

class LibrarySerializer(serializers.ModelSerializer):
    class Meta:
        model = Library
        fields = '__all__'

class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = '__all__'

# -------------------------
# ViewSets with Permissions
# -------------------------
class SampleViewSet(viewsets.ModelViewSet):
    queryset = Sample.objects.all()
    serializer_class = SampleSerializer
    permission_classes = [IsAuthenticated]

    def get_permissions(self):
        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            # Only Admin or Technician can modify
            return [IsAuthenticated(), IsTechnicianOrAdmin()]
        # Read-only for others
        return [IsAuthenticated()]

class LibraryViewSet(viewsets.ModelViewSet):
    queryset = Library.objects.all()
    serializer_class = LibrarySerializer
    permission_classes = [IsAuthenticated]

    def get_permissions(self):
        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            # Only Admin can modify
            return [IsAuthenticated(), IsAdmin()]
        return [IsAuthenticated()]

class ProjectViewSet(viewsets.ModelViewSet):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer
    permission_classes = [IsAuthenticated]

    def get_permissions(self):
        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            # Only Admin or PI can modify
            return [IsAuthenticated(), IsAdminOrPI()]
        return [IsAuthenticated()]
