PIPELINE_MAPPING = {
    ("RNA-Seq", None, "ProjectA"): ["qc_pipeline.nf", "alignment_pipeline.nf"],
    ("Exome", None, "ProjectB"): ["qc_pipeline.nf", "exome_alignment.nf", "variant_calling.nf"],
    ("Metagenomics", None, None): ["qc_pipeline.nf", "metagenomics_pipeline.nf"],
}
