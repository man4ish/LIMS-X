from rest_framework import permissions

class IsTechnicianOrAdmin(permissions.BasePermission):
    """
    Allows access only to Admin or Technician users.
    """
    def has_permission(self, request, view):
        user = request.user
        return (
            user.is_superuser
            or user.groups.filter(name='Admin').exists()
            or user.groups.filter(name='Technician').exists()
        )

class IsAdminOrPI(permissions.BasePermission):
    """
    Allows access only to Admin or PI / Scientist users.
    """
    def has_permission(self, request, view):
        user = request.user
        return (
            user.is_superuser
            or user.groups.filter(name='Admin').exists()
            or user.groups.filter(name='PI').exists()
        )

class IsAdmin(permissions.BasePermission):
    """
    Allows access only to Admin users.
    """
    def has_permission(self, request, view):
        user = request.user
        return user.is_superuser or user.groups.filter(name='Admin').exists()

class IsTechnician(permissions.BasePermission):
    """
    Allows access only to Technician users.
    """
    def has_permission(self, request, view):
        return request.user.groups.filter(name='Technician').exists()

class IsPI(permissions.BasePermission):
    """
    Allows access only to PI / Scientist users.
    """
    def has_permission(self, request, view):
        return request.user.groups.filter(name='PI').exists()

class ReadOnly(permissions.BasePermission):
    """
    Grants read-only access (GET, HEAD, OPTIONS) for viewers or other roles.
    """
    def has_permission(self, request, view):
        return request.method in permissions.SAFE_METHODS
