from rest_framework import viewsets, serializers
from rest_framework.permissions import IsAuthenticated
from core.models import Sample, Library, Project
from core.permissions import IsTechnicianOrAdmin, IsAdmin, IsAdminOrPI
from core.models_audit import SampleAuditLog

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

    # ---------------------------
    # RBAC Permissions (safe)
    # ---------------------------
    def get_permissions(self):
        action = getattr(self, 'action', None)  # safer than self.action
        if action in ['create', 'update', 'partial_update', 'destroy']:
            return [IsAuthenticated(), IsTechnicianOrAdmin()]
        return [IsAuthenticated()]

    # ---------------------------
    # Helper: Get Client IP
    # ---------------------------
    def get_ip(self):
        x_forwarded_for = self.request.META.get("HTTP_X_FORWARDED_FOR")
        if x_forwarded_for:
            return x_forwarded_for.split(",")[0]
        return self.request.META.get("REMOTE_ADDR")

    # ---------------------------
    # CREATE Audit
    # ---------------------------
    def perform_create(self, serializer):
        instance = serializer.save()
        SampleAuditLog.objects.create(
            sample=instance,
            action="CREATE",
            changed_by=self.request.user,
            new_data=serializer.data,
            ip_address=self.get_ip()
        )

    # ---------------------------
    # UPDATE Audit
    # ---------------------------
    def perform_update(self, serializer):
        instance = self.get_object()
        old_state = SampleSerializer(instance).data
        updated_instance = serializer.save()

        SampleAuditLog.objects.create(
            sample=updated_instance,
            action="UPDATE",
            changed_by=self.request.user,
            old_data=old_state,
            new_data=serializer.data,
            ip_address=self.get_ip()
        )

    # ---------------------------
    # DELETE Audit
    # ---------------------------
    def perform_destroy(self, instance):
        old_state = SampleSerializer(instance).data
        SampleAuditLog.objects.create(
            sample=instance,
            action="DELETE",
            changed_by=self.request.user,
            old_data=old_state,
            ip_address=self.get_ip()
        )
        instance.delete()


class LibraryViewSet(viewsets.ModelViewSet):
    queryset = Library.objects.all()
    serializer_class = LibrarySerializer
    permission_classes = [IsAuthenticated]

    def get_permissions(self):
        action = getattr(self, 'action', None)
        if action in ['create', 'update', 'partial_update', 'destroy']:
            return [IsAuthenticated(), IsAdmin()]
        return [IsAuthenticated()]


class ProjectViewSet(viewsets.ModelViewSet):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer
    permission_classes = [IsAuthenticated]

    def get_permissions(self):
        action = getattr(self, 'action', None)
        if action in ['create', 'update', 'partial_update', 'destroy']:
            return [IsAuthenticated(), IsAdminOrPI()]
        return [IsAuthenticated()]
