# ── Admin Policies ───────────────────────────────────────────
resource "vault_policy" "admin" {
  name = "admin-policy"

  policy = <<-EOT
    path "*" {
      capabilities = ["create", "read", "update", "delete"]
    }
  EOT
}

# ── Infrastructure Policies ──────────────────────────────────
resource "vault_policy" "infrastructure_networking" {
  name = "infrastructure-networking-policy"

  policy = <<-EOT
    path "infrastructure/data/networking/*" {
      capabilities = ["read"]
    }
  EOT
}

resource "vault_policy" "infrastructure_storage" {
  name = "infrastructure-storage-policy"

  policy = <<-EOT
    path "infrastructure/data/storage/*" {
      capabilities = ["read"]
    }
  EOT
}

resource "vault_policy" "infrastructure_security" {
  name = "infrastructure-security-policy"

  policy = <<-EOT
    path "infrastructure/data/security/*" {
      capabilities = ["read"]
    }
  EOT
}

# ── Platform Policies ────────────────────────────────────────
resource "vault_policy" "platform_databases" {
  name = "platform-databases-policy"

  policy = <<-EOT
    path "platform/data/databases/*" {
      capabilities = ["read"]
    }
  EOT
}

resource "vault_policy" "platform_tooling" {
  name = "platform-tooling-policy"

  policy = <<-EOT
    path "platform/data/tooling/*" {
      capabilities = ["read"]
    }
  EOT
}

# ── Workload Policies ────────────────────────────────────────
resource "vault_policy" "workloads_microservices" {
  name = "workloads-microservices-policy"

  policy = <<-EOT
    path "workloads/data/microservices/*" {
      capabilities = ["read"]
    }
  EOT
}

resource "vault_policy" "workloads_standalone" {
  name = "workloads-standalone-policy"

  policy = <<-EOT
    path "workloads/data/standalone/*" {
      capabilities = ["read"]
    }
  EOT
}

resource "vault_policy" "workloads_third_party" {
  name = "workloads-third-party-policy"

  policy = <<-EOT
    path "workloads/data/third-party/*" {
      capabilities = ["read"]
    }
  EOT
}

# ── Terraform-specific Policy ─────────────────────────────────
resource "vault_policy" "terraform_operator" {
  name   = "terraform-operator"
  policy = <<-EOT
    path "sys/mounts/*"          { capabilities = ["create", "read", "update", "delete"] }
    path "auth/*"                { capabilities = ["create", "read", "update", "delete"] }
    path "sys/policies/*"        { capabilities = ["create", "read", "update", "delete"] }
  EOT
}
