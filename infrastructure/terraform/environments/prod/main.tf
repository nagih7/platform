module "root" {
  source = "../../"
}

module "virtual_machine" {
  source   = "../../modules/vm"
  for_each = try(local.configuration.virtual_machines, {})

  vm_config = merge(each.value, {
    user = merge(each.value.user, {
      password = var.vm_default_password
    })
  })
}
