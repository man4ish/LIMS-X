# core/models_metadata.py

from django.db import models
from django.contrib.auth import get_user_model
from core.models import Sample
from core.models_audit import SampleAuditLog

User = get_user_model()

class SampleMetadataVersion(models.Model):
    sample = models.ForeignKey(Sample, on_delete=models.CASCADE, related_name="metadata_versions")
    version_number = models.PositiveIntegerField()
    timestamp = models.DateTimeField(auto_now_add=True)
    changed_by = models.ForeignKey(User, null=True, blank=True, on_delete=models.SET_NULL)
    metadata = models.JSONField()
    change_summary = models.TextField(blank=True, null=True)
    source_audit_log = models.ForeignKey(SampleAuditLog, null=True, blank=True, on_delete=models.SET_NULL)

    class Meta:
        ordering = ["-version_number"]
        unique_together = ("sample", "version_number")

    def __str__(self):
        return f"{self.sample.label} v{self.version_number}"
