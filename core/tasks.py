from celery import shared_task
import subprocess
from core.models import PipelineRun, Sample
from django.utils import timezone

@shared_task
def trigger_nextflow_pipeline(sample_id, pipeline_name):
    sample = Sample.objects.get(id=sample_id)
    run = PipelineRun.objects.create(
        sample=sample,
        pipeline_name=pipeline_name,
        status="running"
    )
    try:
        cmd = f"nextflow run /path/to/{pipeline_name} --sample_id {sample.id}"
        subprocess.run(cmd, shell=True, check=True)
        run.status = "completed"
    except subprocess.CalledProcessError:
        run.status = "failed"
    finally:
        run.finished_at = timezone.now()
        run.save()
