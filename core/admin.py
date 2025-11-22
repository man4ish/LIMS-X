from django.contrib import admin
from .models import Organism, Project, SampleType, SpecimenSource, Sample
from .models_audit import SampleAuditLog
from django.utils.html import format_html

# -----------------------------
# Register existing models
# -----------------------------
admin.site.register(Organism)
admin.site.register(Project)
admin.site.register(SampleType)
admin.site.register(SpecimenSource)
admin.site.register(Sample)

# -----------------------------
# Audit Log Admin
# -----------------------------
@admin.register(SampleAuditLog)
class SampleAuditLogAdmin(admin.ModelAdmin):
    list_display = (
        "id",
        "sample",
        "action",
        "changed_by",
        "timestamp",
        "ip_address",
        "diff_preview",  # Shows changed fields in list view
    )

    list_filter = (
        "action",
        "changed_by",
        "timestamp",
    )

    search_fields = (
        "sample__label",
        "changed_by__username",
    )

    readonly_fields = (
        "sample",
        "action",
        "changed_by",
        "timestamp",
        "old_data",
        "new_data",
        "ip_address",
        "remarks",
        "display_diff",  # Shows side-by-side diff in detail view
    )

    ordering = ("-timestamp",)

    # -----------------------------
    # List view preview of changed fields
    # -----------------------------
    def diff_preview(self, obj):
        diff = obj.get_diff() if hasattr(obj, "get_diff") else None
        if not diff:
            return "-"
        return ", ".join(diff.keys())
    diff_preview.short_description = "Changed Fields"

    # -----------------------------
    # Detail view side-by-side diff
    # -----------------------------
    def display_diff(self, obj):
        diff = obj.get_diff() if hasattr(obj, "get_diff") else None
        if not diff:
            return "No changes"
        html = "<table style='border-collapse: collapse; width: 100%;'>"
        html += "<tr><th style='border: 1px solid #ccc; padding: 4px;'>Field</th>"
        html += "<th style='border: 1px solid #ccc; padding: 4px;'>Old Value</th>"
        html += "<th style='border: 1px solid #ccc; padding: 4px;'>New Value</th></tr>"
        for field, values in diff.items():
            html += f"<tr>"
            html += f"<td style='border: 1px solid #ccc; padding: 4px;'>{field}</td>"
            html += f"<td style='border: 1px solid #ccc; padding: 4px;'>{values['old']}</td>"
            html += f"<td style='border: 1px solid #ccc; padding: 4px;'>{values['new']}</td>"
            html += f"</tr>"
        html += "</table>"
        return format_html(html)
    display_diff.short_description = "Field Changes"
