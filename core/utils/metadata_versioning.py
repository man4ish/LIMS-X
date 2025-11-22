# core/utils/metadata_versioning.py

def create_metadata_version(sample, user=None, audit_log=None):
    """
    Create a new metadata version for a sample if metadata has changed.
    """
    last_version = sample.metadata_versions.order_by('-version_number').first()
    new_version_number = (last_version.version_number + 1) if last_version else 1

    # Skip if metadata is unchanged
    if last_version and last_version.metadata == sample.metadata:
        return

    SampleMetadataVersion.objects.create(
        sample=sample,
        version_number=new_version_number,
        changed_by=user,
        metadata=sample.metadata,
        source_audit_log=audit_log
    )
