output "vault_mount_paths" {
  description = "All configured KV mount paths"
  value = {
    infrastructure = vault_mount.infrastructure_kv.path
    platform       = vault_mount.platform_kv.path
    workloads      = vault_mount.workloads_kv.path
    cicd           = vault_mount.cicd_kv.path
  }
}

output "configured_roles" {
  description = "All configured Kubernetes auth roles"
  value       = keys(vault_kubernetes_auth_backend_role.roles)
}
