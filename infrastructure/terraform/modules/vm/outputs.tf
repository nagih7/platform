output "vm_info" {
  description = "VM basic information"
  value = {
    id      = proxmox_virtual_environment_vm.this.vm_id
    name    = proxmox_virtual_environment_vm.this.name
    address = var.vm_config.ip_config.address
  }
}
