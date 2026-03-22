locals {
  k8s_roles = {
    networking-role = {
      service_accounts = ["net-vault-sa"]
      namespaces       = ["networking", "cloudflare", "traefik"]
      policies         = [vault_policy.infrastructure_networking.name]
    }
    storage-role = {
      service_accounts = ["storage-vault-sa"]
      namespaces       = ["storage"]
      policies         = [vault_policy.infrastructure_storage.name]
    }
    security-role = {
      service_accounts = ["sec-vault-sa"]
      namespaces       = ["security"]
      policies         = [vault_policy.infrastructure_security.name]
    }
    databases-role = {
      service_accounts = ["db-vault-sa"]
      namespaces       = ["databases", "postgres", "redis"]
      policies         = [vault_policy.platform_databases.name]
    }
    tool-role = {
      service_accounts = ["tool-vault-sa"]
      namespaces       = ["tooling", "gitlab", "runner"]
      policies         = [vault_policy.platform_tooling.name]
    }
    microservices-role = {
      service_accounts = ["ms-vault-sa"]
      namespaces       = ["microservices"]
      policies         = [vault_policy.workloads_microservices.name]
    }
    standalone-role = {
      service_accounts = ["standalone-vault-sa"]
      namespaces       = ["discord-bots"]
      policies         = [vault_policy.workloads_standalone.name]
    }
    third-party-role = {
      service_accounts = ["third-party-vault-sa"]
      namespaces       = ["vaultwarden", "seafile", "discord-bots"]
      policies         = [vault_policy.workloads_third_party.name]
    }
  }
}

resource "vault_kubernetes_auth_backend_role" "roles" {
  for_each = local.k8s_roles

  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = each.key
  bound_service_account_names      = each.value.service_accounts
  bound_service_account_namespaces = each.value.namespaces
  token_policies                   = each.value.policies
  token_ttl                        = 3600
}
