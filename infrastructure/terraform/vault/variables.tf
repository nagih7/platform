variable "vault_address" {
  description = "Vault server address"
  type        = string
  default     = "https://vault.nooblearn2code.com"
}

variable "vault_token" {
  description = "Vault root token (only for initial bootstrap)"
  type        = string
  sensitive   = true
}

variable "kubernetes_host" {
  description = "Kubernetes API server URL"
  type        = string
  default     = "https://kubernetes.default.svc"
}
