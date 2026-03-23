# ── Terraform-specific Policy ─────────────────────────────────
resource "vault_policy" "terraform_operator" {
  name   = "terraform-operator"
  policy = <<-EOT
    path "sys/mounts/*"          { capabilities = ["create", "read", "update", "delete"] }
    path "auth/*"                { capabilities = ["create", "read", "update", "delete"] }
    path "sys/policies/*"        { capabilities = ["create", "read", "update", "delete"] }
  EOT
}

# ── Admin Policies ───────────────────────────────────────────
resource "vault_policy" "admin" {
  name = "admin-policy"

  policy = <<-EOT
    path "*" {
      capabilities = ["create", "read", "update", "delete", "list"]
    }
  EOT
}

# ── CI Policies ───────────────────────────────────────────
resource "vault_policy" "ci_build" {
  name = "ci-build-policy"

  policy = <<-EOT
    path "cicd/data/docker" {
      capabilities = ["read"]
    }
    path "cicd/data/github" {
      capabilities = ["read"]
    }
  EOT
}

# ── Infrastructure Policies ──────────────────────────────────
resource "vault_policy" "infrastructure_networking" {
  name = "infrastructure-networking-policy"

  policy = <<-EOT
    path "infrastructure/data/networking/*" { capabilities = ["read"] }
    path "infrastructure/metadata/networking/*" { capabilities = ["list"] }
  EOT
}

resource "vault_policy" "infrastructure_storage" {
  name = "infrastructure-storage-policy"

  policy = <<-EOT
    path "infrastructure/data/storage/*" { capabilities = ["read"] }
    path "infrastructure/metadata/storage/*" { capabilities = ["list"] }
  EOT
}

resource "vault_policy" "infrastructure_security" {
  name = "infrastructure-security-policy"

  policy = <<-EOT
    path "infrastructure/data/security/*" { capabilities = ["read"] }
    path "infrastructure/metadata/security/*" { capabilities = ["list"] }
  EOT
}

# ── Platform Policies ────────────────────────────────────────
resource "vault_policy" "platform_databases" {
  name = "platform-databases-policy"

  policy = <<-EOT
    path "platform/data/databases/*" { capabilities = ["read"] }
    path "platform/metadata/databases/*" { capabilities = ["list"] }
  EOT
}

resource "vault_policy" "platform_tooling" {
  name = "platform-tooling-policy"

  policy = <<-EOT
    path "platform/data/tooling/*" { capabilities = ["read"] }
    path "platform/metadata/tooling/*" { capabilities = ["list"] }
  EOT
}

# ── Workload Policies ────────────────────────────────────────
resource "vault_policy" "workloads" {
  name = "workloads-policy"

  policy = <<-EOT
    path "workloads/data/*" { capabilities = ["read"] }
    path "workloads/metadata/*" { capabilities = ["list"] }
  EOT
}

resource "vault_policy" "workloads_microservices" {
  name = "workloads-microservices-policy"

  policy = <<-EOT
    path "workloads/data/microservices/*" { capabilities = ["read"] }
    path "workloads/metadata/microservices/*" { capabilities = ["list"] }
  EOT
}

resource "vault_policy" "workloads_standalone" {
  name = "workloads-standalone-policy"

  policy = <<-EOT
    path "workloads/data/standalone/*" { capabilities = ["read"] }
    path "workloads/metadata/standalone/*" { capabilities = ["list"] }
  EOT
}

resource "vault_policy" "workloads_third_party" {
  name = "workloads-third-party-policy"

  policy = <<-EOT
    path "workloads/data/third-party/*" { capabilities = ["read"] }
    path "workloads/metadata/third-party/*" { capabilities = ["list"] }
  EOT
}

# ── Resumind Policies ──────────────────────────────────────
resource "vault_policy" "workloads_microservices_resumind" {
  name = "resumind-policy"

  policy = <<-EOT
    path "workloads/metadata/microservices/resumind/" { capabilities = ["list"] }
    path "workloads/data/microservices/resumind" { capabilities = ["create", "read", "update", "delete", "list"] }
  EOT
}

# ── Uniquizz Policies ─────────────────────────────
resource "vault_policy" "workloads_microservices_uniquizz" {
  name = "uniquizz-policy"

  policy = <<-EOT
    path "workloads/metadata/microservices/uniquizz*" { capabilities = ["list"] }
    path "workloads/data/microservices/uniquizz*" { capabilities = ["create", "read", "update", "delete", "list"] }
  EOT
}

