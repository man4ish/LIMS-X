from django.test import TestCase
from django.contrib.auth import get_user_model

from core.models import (
    Project, Sample, Organism, Gemstone,
    SampleType, SpecimenSource
)
from core.models_metadata import SampleMetadataVersion
from core.models_audit import SampleAuditLog


class MetadataVersioningTest(TestCase):

    def setUp(self):
        """
        Create required objects for Sample so metadata versioning can run.
        """

        User = get_user_model()
        self.user = User.objects.create_user(
            username="testuser",
            password="password123"
        )

        # Required FK objects
        self.gemstone = Gemstone.objects.create(label="Ruby")
        self.organism = Organism.objects.create(label="Human")
        self.sample_type = SampleType.objects.create(name="DNA")
        self.specimen_source = SpecimenSource.objects.create(name="Blood")

        self.project = Project.objects.create(
            label="Test Project",
            gemstone=self.gemstone
        )

        # Sample instance
        self.sample = Sample.objects.create(
            label="Test Sample",
            description="Initial description",
            organism=self.organism,
            project=self.project,
            sample_type=self.sample_type,
            specimen_source=self.specimen_source
        )

    def test_create_initial_version(self):
        """
        A new Sample should automatically generate version 1.
        """
        versions = SampleMetadataVersion.objects.filter(sample=self.sample)

        self.assertEqual(
            versions.count(), 1,
            "Initial version should be created automatically."
        )

        v1 = versions.first()
        self.assertEqual(v1.version_number, 1)
        self.assertEqual(v1.metadata["description"], "Initial description")

    def test_no_new_version_if_unchanged(self):
        """
        Saving the sample without changes should NOT create a new version.
        """
        before = SampleMetadataVersion.objects.count()

        self.sample.save()  # no change
        after = SampleMetadataVersion.objects.count()

        self.assertEqual(
            before, after,
            "No new version should be created when metadata is unchanged."
        )

    def test_create_new_version_on_update(self):
        """
        Updating metadata should create a new version.
        """
        before = SampleMetadataVersion.objects.count()

        self.sample.description = "Updated description"
        self.sample.save()

        after = SampleMetadataVersion.objects.count()

        self.assertEqual(
            after, before + 1,
            "Updating metadata must create a new version."
        )

        latest = SampleMetadataVersion.objects.filter(sample=self.sample).latest("version_number")

        self.assertEqual(latest.version_number, 2)
        self.assertEqual(latest.metadata["description"], "Updated description")

    def test_version_links_to_audit_log(self):
        """
        Metadata version entry should link to a SampleAuditLog when provided.
        """

        audit = SampleAuditLog.objects.create(
            sample=self.sample,
            changed_by=self.user,
            action="UPDATE",
            diff={"description": {"old": "Initial description", "new": "Audit Updated"}},
        )

        # perform update
        self.sample.description = "Audit Updated"
        self.sample.save()

        latest = SampleMetadataVersion.objects.filter(sample=self.sample).latest("version_number")

        self.assertIsNotNone(
            latest.source_audit_log,
            "Metadata version must reference the source audit log."
        )
        self.assertEqual(latest.source_audit_log.id, audit.id)
