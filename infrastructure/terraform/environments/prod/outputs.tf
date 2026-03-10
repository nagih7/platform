output "virtual_machines" {
  description = "Summary of all managed VMs"
  value = {
    for k, v in module.virtual_machine : k => v.vm_info
  }
}
