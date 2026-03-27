data "vault_auth_backend" "userpass" {
  path = "userpass"
}

resource "vault_identity_entity_alias" "nagih_userpass" {
  name           = "nagih"
  mount_accessor = data.vault_auth_backend.userpass.accessor
  canonical_id   = vault_identity_entity.nagih.id
}

resource "vault_identity_entity_alias" "hoanggxyuuki_userpass" {
  name           = "hoanggxyuuki"
  mount_accessor = data.vault_auth_backend.userpass.accessor
  canonical_id   = vault_identity_entity.hoanggxyuuki.id
}

resource "vault_identity_entity_alias" "nghuytan_userpass" {
  name           = "nghuytan"
  mount_accessor = data.vault_auth_backend.userpass.accessor
  canonical_id   = vault_identity_entity.nghuytan.id
}

resource "vault_identity_entity_alias" "lucastran05_userpass" {
  name           = "lucastran05"
  mount_accessor = data.vault_auth_backend.userpass.accessor
  canonical_id   = vault_identity_entity.lucastran05.id
}

resource "vault_identity_entity_alias" "kkevin_userpass" {
  name           = "kkevin"
  mount_accessor = data.vault_auth_backend.userpass.accessor
  canonical_id   = vault_identity_entity.kkevin.id
}


