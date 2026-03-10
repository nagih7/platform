variable "vm_config" {
  description = "VM full config"
  type = object({
    id            = number
    name          = string
    node          = string
    scsi_hardware = optional(string, "virtio-scsi-single")
    template_id   = optional(number, null)

    # Resource
    cpu    = number
    memory = number
    disks = list(object({
      datastore_id = string
      interface    = string
      size         = number
      file_format  = string
      discard      = optional(string, "on")
      ssd          = optional(bool)
    }))

    dns = list(string)

    ip_config = object({
      address = string
      gateway = string
    })

    user = object({
      username = string
      password = optional(string, "")
      keys     = list(string)
    })
  })
}
