# code: language=Terraform tabSize=2

# =============================================================================
# Provisioner - vsphere
# =============================================================================

variable "vsphere_server" {
  type    = string
  default = "iaas-001-vcs01.vcloud"
}

variable "vsphere_user" {
  type = string
}

variable "vsphere_password" {
  type      = string
  sensitive = true
}

variable "vsphere_datacenter" {
  type    = string
  default = "iaas-001-datacenter"
}

# =============================================================================
# Docker
# =============================================================================

variable "docker_hub_username" {
  description = "Docker Hub (main registry) username"
  type        = string
}

variable "docker_hub_password" {
  description = "Docker Hub (main registry) password"
  type        = string
  sensitive   = true
}
