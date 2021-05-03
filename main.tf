# code: language=Terraform tabSize=2


module "docker-registry-kirchberg" {
  # Meta
  source                = "./modules/node"
  name                  = "docker-registry-kirchberg"
  hostname              = "docker-registry-kirchberg.dt.ept.lu"
  # General
  resource_pool_id      = data.vsphere_resource_pool.kirchberg_low.id
  datastore_cluster_id  = data.vsphere_datastore_cluster.default.id
  # datastore_id          = data.vsphere_datastore.kirchberg_01.id
  vm_folder             = "_root/DATI : ICT/K8S/registries"
  num_cpus              = 4
  memory                = 4096
  guest_id              = data.vsphere_virtual_machine.template.guest_id
  template_uuid         = data.vsphere_virtual_machine.template.id
  # Network
  network_id            = data.vsphere_network.k8s_servers.id
  network_ip            = "172.29.42.12/24"
  # Disk
  disk_system_label     = "disk0"
  disk_system_size      = 200
  # Docker
  docker_hub_username   = var.docker_hub_username
  docker_hub_password   = var.docker_hub_password
}

module "docker-registry-gare" {
  # Meta
  source                = "./modules/node"
  name                  = "docker-registry-gare"
  hostname              = "docker-registry-gare.dt.ept.lu"
  # General
  resource_pool_id      = data.vsphere_resource_pool.gare_low.id
  datastore_cluster_id  = data.vsphere_datastore_cluster.default.id
  # datastore_id          = data.vsphere_datastore.gare_01.id
  vm_folder             = "_root/DATI : ICT/K8S/registries"
  num_cpus              = 4
  memory                = 4096
  guest_id              = data.vsphere_virtual_machine.template.guest_id
  template_uuid         = data.vsphere_virtual_machine.template.id
  # Network
  network_id            = data.vsphere_network.k8s_servers.id
  network_ip            = "172.29.42.13/24"
  # Disk
  disk_system_label     = "disk0"
  disk_system_size      = 200
  # Docker
  docker_hub_username   = var.docker_hub_username
  docker_hub_password   = var.docker_hub_password
}
