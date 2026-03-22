resource "vault_mount" "cicd_kv" {
  path        = "cicd"
  type        = "kv"
  options     = { version = "2" }
  description = "CI/CD secrets (docker credentials, github tokens)"

  lifecycle {
    prevent_destroy = true
  }
}

# ── Infrastructure Tier ──────────────────────────────────────
resource "vault_mount" "infrastructure_kv" {
  path        = "infrastructure"
  type        = "kv"
  options     = { version = "2" }
  description = "Infrastructure secrets (networking, storage, security)"

  lifecycle {
    prevent_destroy = true
  }
}

# ── Platform Tier ────────────────────────────────────────────
resource "vault_mount" "platform_kv" {
  path        = "platform"
  type        = "kv"
  options     = { version = "2" }
  description = "Platform secrets (databases, tooling)"
}

# ── Workloads Tier ───────────────────────────────────────────
resource "vault_mount" "workloads_kv" {
  path        = "workloads"
  type        = "kv"
  options     = { version = "2" }
  description = "Workload secrets (microservices, third-party, standalone)"
}
