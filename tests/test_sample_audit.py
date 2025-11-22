import os
import django
import sys

# Add project root to Python path
PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.append(PROJECT_ROOT)

# Setup Django environment
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "lab_data_manager.settings")
django.setup()

from core.models import Sample
from core.models_audit import SampleAuditLog
from core.api_views import SampleViewSet, SampleSerializer
from django.contrib.auth import get_user_model
from rest_framework.test import APIRequestFactory

User = get_user_model()
factory = APIRequestFactory()

def print_audit_logs(sample_id, sample_label=None):
    logs = SampleAuditLog.objects.filter(sample_id=sample_id)
    label = sample_label or f"id={sample_id}"
    print(f"\nTotal audit logs for sample '{label}': {logs.count()}\n")
    for log in logs:
        print(f"Action: {log.action}")
        print(f"Changed by: {log.changed_by}")
        print(f"Timestamp: {log.timestamp}")
        print(f"Diff: {log.get_diff()}")
        print("-" * 50)

def test_sample_audit():
    sample = Sample.objects.first()
    if not sample:
        print("No sample found in database!")
        return

    print(f"Original sample description: {sample.description}")

    viewset = SampleViewSet()
    user = User.objects.first()
    if not user:
        print("No user found for audit logging!")
        return

    # First UPDATE
    request_patch1 = factory.patch(f"/api/samples/{sample.id}/", data={"description": "Updated description 1"})
    request_patch1.user = user
    viewset.request = request_patch1
    viewset.kwargs = {"pk": sample.id}

    serializer1 = SampleSerializer(sample, data={"description": "Updated description 1"}, partial=True)
    serializer1.is_valid(raise_exception=True)
    viewset.perform_update(serializer1)
    print("\nAfter first UPDATE:")
    print_audit_logs(sample.id, sample.label)

    # Second UPDATE
    request_patch2 = factory.patch(f"/api/samples/{sample.id}/", data={"description": "Updated description 2"})
    request_patch2.user = user
    viewset.request = request_patch2
    viewset.kwargs = {"pk": sample.id}

    serializer2 = SampleSerializer(sample, data={"description": "Updated description 2"}, partial=True)
    serializer2.is_valid(raise_exception=True)
    viewset.perform_update(serializer2)
    print("\nAfter second UPDATE:")
    print_audit_logs(sample.id, sample.label)

    # DELETE
    request_delete = factory.delete(f"/api/samples/{sample.id}/")
    request_delete.user = user
    viewset.request = request_delete
    viewset.kwargs = {"pk": sample.id}

    viewset.perform_destroy(sample)
    print("\nAfter DELETE:")
    print(f"Sample exists? {Sample.objects.filter(pk=sample.id).exists()}")
    print_audit_logs(sample.id, sample.label)

if __name__ == "__main__":
    test_sample_audit()
