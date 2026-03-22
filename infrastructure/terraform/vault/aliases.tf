data "vault_auth_backend" "userpass" {
  path = "userpass"
}

resource "vault_identity_entity_alias" "nagih_userpass" {
  name           = "nagih" # must match the userpass username exactly
  mount_accessor = data.vault_auth_backend.userpass.accessor
  canonical_id   = vault_identity_entity.nagih.id
}

resource "vault_identity_entity_alias" "hoanggxyuuki_userpass" {
  name           = "hoanggxyuuki" # must match the userpass username exactly
  mount_accessor = data.vault_auth_backend.userpass.accessor
  canonical_id   = vault_identity_entity.hoanggxyuuki.id
}

