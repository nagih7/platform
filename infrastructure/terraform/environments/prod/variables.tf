variable "proxmox_endpoint" {
  description = "Proxmox VE API endpoint URL"
  type        = string
  default     = "https://192.168.1.200:8006/"
}

variable "proxmox_api_token" {
  description = "Proxmox VE API token (format: user@realm!tokenid=token-value)"
  type        = string
  sensitive   = true
}

variable "vm_default_password" {
  description = "Default password for VM user accounts"
  type        = string
  sensitive   = true
}
