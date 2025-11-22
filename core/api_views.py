from rest_framework import viewsets, serializers
from rest_framework.permissions import IsAuthenticated
from core.models import Sample, Library, Project
from core.permissions import IsTechnicianOrAdmin, IsAdmin, IsAdminOrPI
from core.models_audit import SampleAuditLog
from core.models_metadata import SampleMetadataVersion


def create_metadata_version(sample, user=None, audit_log=None, change_summary=None):
    """
    Create a new metadata version for a sample if metadata has changed.
    
    Args:
        sample: Sample instance
        user: User instance making the change
        audit_log: Optional SampleAuditLog entry
        change_summary: Optional text describing the change
    """
    # Serialize current metadata
    from core.api_views import SampleSerializer
    current_metadata = SampleSerializer(sample).data

    # Get the latest version
    latest_version = SampleMetadataVersion.objects.filter(sample=sample).order_by('-version_number').first()

    # If there is a latest version, compare metadata
    if latest_version:
        if latest_version.metadata == current_metadata:
            # No changes; skip version creation
            return latest_version
        version_number = latest_version.version_number + 1
    else:
        version_number = 1  # First version

    # Create new version entry
    new_version = SampleMetadataVersion.objects.create(
        sample=sample,
        version_number=version_number,
        changed_by=user,
        metadata=current_metadata,
        change_summary=change_summary,
        source_audit_log=audit_log
    )

    return new_version

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

class SampleMetadataVersionSerializer(serializers.ModelSerializer):
    class Meta:
        model = SampleMetadataVersion
        fields = '__all__'

class SampleMetadataVersionViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = SampleMetadataVersionSerializer

    def get_queryset(self):
        sample_id = self.kwargs['sample_id']
        return SampleMetadataVersion.objects.filter(sample_id=sample_id)

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
        old_data = SampleSerializer(instance).data
        updated_instance = serializer.save()

        audit_entry = SampleAuditLog.objects.create(
            sample=updated_instance,
            action="UPDATE",
            changed_by=self.request.user,
            old_data=old_data,
            new_data=serializer.data,
            ip_address=self.get_ip()
        )

        # Create metadata version only if there are changes
        create_metadata_version(updated_instance, user=self.request.user, audit_log=audit_entry)

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
