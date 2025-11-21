# from django.db.models.signals import post_save
# from django.dispatch import receiver
# from core.models import Sample
# from core.tasks import trigger_nextflow_pipeline
# from core.pipelines import PIPELINE_MAPPING

# @receiver(post_save, sender=Sample)
# def run_pipelines_on_sample_submission(sender, instance, created, **kwargs):
#     if created:
#         sequence_type = getattr(instance.sample_type, 'name', None)
#         project = getattr(instance.project, 'label', None)
#         pipelines_to_run = PIPELINE_MAPPING.get(
#             (sequence_type, None, project),
#             ["qc_pipeline.nf"]
#         )
#         for pipeline in pipelines_to_run:
#             trigger_nextflow_pipeline.delay(instance.id, pipeline)
