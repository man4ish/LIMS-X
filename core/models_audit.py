from django.db import models
from django.contrib.auth import get_user_model
from core.models import Sample

User = get_user_model()

class SampleAuditLog(models.Model):
    ACTIONS = [
        ("CREATE", "Create"),
        ("UPDATE", "Update"),
        ("DELETE", "Delete"),
    ]

    sample = models.ForeignKey(
        Sample,
        on_delete=models.CASCADE,
        related_name="audit_logs",  # For reverse lookup: sample.audit_logs.all()
        db_index=True                # Faster filtering in queries
    )
    action = models.CharField(
        max_length=10,
        choices=ACTIONS,
        db_index=True                # Helpful for admin filtering
    )
    changed_by = models.ForeignKey(
        User,
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="sample_changes"  # Reverse lookup: user.sample_changes.all()
    )
    timestamp = models.DateTimeField(auto_now_add=True, db_index=True)

    old_data = models.JSONField(null=True, blank=True)
    new_data = models.JSONField(null=True, blank=True)

    ip_address = models.GenericIPAddressField(null=True, blank=True)
    remarks = models.TextField(null=True, blank=True)

    class Meta:
        ordering = ["-timestamp"]
        indexes = [
            models.Index(fields=["sample", "timestamp"]),
        ]

    def __str__(self):
        return f"{self.sample.label} - {self.action} - {self.timestamp}"

    # -----------------------------
    # Helper: return only changed fields
    # -----------------------------
    def get_diff(self):
        """
        Return a dict of fields that changed with old/new values.
        Handles CREATE, UPDATE, DELETE.
        """
        if self.action == "CREATE":
            return {k: {"old": None, "new": v} for k, v in (self.new_data or {}).items()}
        elif self.action == "DELETE":
            return {k: {"old": v, "new": None} for k, v in (self.old_data or {}).items()}
        elif self.action == "UPDATE":
            old = self.old_data or {}
            new = self.new_data or {}
            diff = {}
            for key in set(old.keys()).union(new.keys()):
                old_value = old.get(key)
                new_value = new.get(key)
                if old_value != new_value:
                    diff[key] = {"old": old_value, "new": new_value}
            return diff
        return {}
