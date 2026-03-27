resource "vault_identity_group" "admin" {
  name     = "admin"
  type     = "internal"
  policies = [vault_policy.admin.name]

  member_entity_ids = [
    vault_identity_entity.nagih.id
  ]

  metadata = {
    description = "homelab administrators"
  }
}

resource "vault_identity_group" "viewer" {
  name     = "viewer"
  type     = "internal"
  policies = [vault_policy.viewer.name]

  member_entity_ids = [
    vault_identity_entity.kkevin.id
  ]

  metadata = {
    description = "DevOps Engineer"
  }
}

resource "vault_identity_group" "resumind" {
  name = "resumind"
  type = "internal"
  policies = [
    vault_policy.workloads.name,
    vault_policy.workloads_microservices.name,
    vault_policy.workloads_microservices_resumind.name
  ]

  member_entity_ids = [
    vault_identity_entity.hoanggxyuuki.id
  ]

  metadata = {
    description = "Resumind administrators"
  }
}

resource "vault_identity_group" "uniquizz" {
  name = "uniquizz"
  type = "internal"
  policies = [
    vault_policy.workloads.name,
    vault_policy.workloads_microservices.name,
    vault_policy.workloads_microservices_uniquizz.name
  ]

  member_entity_ids = [
    vault_identity_entity.nghuytan.id,
    vault_identity_entity.lucastran05.id
  ]

  metadata = {
    description = "Uniquizz administrators"
  }
}
