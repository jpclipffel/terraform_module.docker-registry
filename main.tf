# code: language=Terraform tabSize=2


resource "vsphere_virtual_machine" "node" {
  # General
  name                 = var.name
  resource_pool_id     = var.resource_pool_id
  # datastore_id         = var.datastore_id
  datastore_cluster_id = var.datastore_cluster_id
  folder               = var.vm_folder
  num_cpus             = var.num_cpus
  num_cores_per_socket = var.num_cpus
  memory               = var.memory
  guest_id             = var.guest_id

  # Virtual machine template
  clone {
    template_uuid = var.template_uuid
  }

  # Network interface
  network_interface {
    network_id = var.network_id
  }

  # System disk
  disk {
    label            = var.disk_system_label
    size             = var.disk_system_size
    thin_provisioned = false
    eagerly_scrub    = false
  }

  # Cloud-init cdrom
  cdrom {
    client_device = true
  }

  # Cloud-init configuration
  vapp {
    properties ={
      hostname = var.hostname
      user-data = base64encode(
        templatefile(
          "${path.module}/templates/cinit.yaml", {
            hostname            = var.hostname,
            network_ip          = var.network_ip,
            docker_hub_username = var.docker_hub_username,
            docker_hub_password = var.docker_hub_password,
          }
        )
      )
    }
  }

  lifecycle {
    ignore_changes = [disk, sync_time_with_host]
  }

}
