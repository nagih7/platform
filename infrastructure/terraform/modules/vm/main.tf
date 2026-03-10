resource "proxmox_virtual_environment_vm" "this" {
  vm_id         = var.vm_config.id
  name          = var.vm_config.name
  node_name     = var.vm_config.node
  scsi_hardware = var.vm_config.scsi_hardware

  clone {
    vm_id = var.vm_config.template_id
    full  = true
  }

  agent {
    enabled = true
  }

  cpu {
    cores = var.vm_config.cpu
  }

  memory {
    dedicated = var.vm_config.memory
  }

  dynamic "disk" {
    for_each = var.vm_config.disks
    content {
      datastore_id = disk.value["datastore_id"]
      interface    = disk.value["interface"]
      size         = disk.value["size"]
      file_format  = lookup(disk.value, "file_format", "raw")
      discard      = lookup(disk.value, "discard", "on")
      ssd          = lookup(disk.value, "ssd", true)
    }
  }

  initialization {
    dns {
      servers = var.vm_config.dns
    }

    ip_config {
      ipv4 {
        address = var.vm_config.ip_config.address
        gateway = var.vm_config.ip_config.gateway
      }
    }
    user_account {
      username = var.vm_config.user.username
      password = var.vm_config.user.password
      keys     = try(var.vm_config.user.keys, [])
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}
