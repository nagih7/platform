resource "vault_identity_entity" "nagih" {
  name     = "nagih"
  policies = [] # policies come from group, not entity directly

  metadata = {
    email = "vuongmanhnghia@gmail.com"
  }
}

resource "vault_identity_entity" "hoanggxyuuki" {
  name     = "hoanggxyuuki"
  policies = []

  metadata = {
    email = "hoang03072005@gmail.com"
  }
}


# resource "vault_identity_group_member_entity_ids" "developers_members" {
#   group_id = vault_identity_group.developers.id
#   member_entity_ids = [
#     vault_identity_entity.darwin.id,
#     vault_identity_entity.kiendt.id,
#     vault_identity_entity.hieuvu.id,
#   ]
# }
