provider "vault" {
  address = var.vault_address
  token   = var.vault_token

  # Skip TLS verify for internal cluster access
  # Set to false in production with proper certs
  skip_tls_verify = true
}
