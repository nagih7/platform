resource "vault_jwt_auth_backend" "gitlab" {
  path         = "jwt"
  type         = "jwt"
  description  = "GitLab JWT auth for CI/CD pipelines"
  jwks_url     = "https://gitlab.nooblearn2code.com/-/jwks"
  bound_issuer = "https://gitlab.nooblearn2code.com"

  lifecycle {
    prevent_destroy = true
  }
}

resource "vault_jwt_auth_backend_role" "ci_build" {
  backend   = vault_jwt_auth_backend.gitlab.path
  role_name = "ci-build-role"
  role_type = "jwt"

  # Token settings
  token_policies = [vault_policy.ci_build.name]
  token_ttl      = 3600

  # JWT claims
  bound_audiences   = ["https://gitlab.nooblearn2code.com"]
  user_claim        = "sub"
  bound_claims_type = "glob"
  bound_claims = {
    project_path = "*/**"
  }
}
