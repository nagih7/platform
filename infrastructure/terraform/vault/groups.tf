resource "vault_identity_group" "admin" {
  name     = "admin"
  type     = "internal"
  policies = [vault_policy.terraform_operator.name]

  member_entity_ids = [
    vault_identity_entity.nagih.id
  ]

  metadata = {
    description = "Homelab administrators"
  }
}

resource "vault_identity_group" "resumind" {
  name = "resumind"
  type = "internal"
  policies = [
    vault_policy.workloads_microservices_resumind.name
  ]

  member_entity_ids = [
    vault_identity_entity.hoanggxyuuki.id
  ]

  metadata = {
    description = "Resumind administrators"
  }
}



# resource "vault_identity_group" "developers" {
#   name = "developers"
#   type = "internal"
#   policies = [
#     vault_policy.workloads_microservices.name,
#     vault_policy.platform_databases.name,
#     vault_policy.platform_tooling.name,
#   ]
#
#   metadata = {
#     description = "Application developers - read workloads and platform"
#   }
# }
