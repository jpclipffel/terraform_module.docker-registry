# code: language=Terraform tabSize=2

# =============================================================================
# General
# =============================================================================

variable "name" {
  description = "Instance name"
  type        = string
}

variable "hostname" {
  description = "Instance hostname"
  type        = string
}

variable "resource_pool_id" {
  description = "The resource pool ID"
  type        = string
}

variable "datastore_cluster_id" {
  description = "The datastore cluster ID"
  type        = string
}

# variable "datastore_id" {
#   description = "The datastore ID"
#   type        = string
# }

variable "vm_folder" {
  description = "The VM folder path relative to the datacenter"
  type        = string
}

variable "num_cpus" {
  description = "The number of CPU and CPU core per socket"
  type        = number
}

variable "memory" {
  description = "The amount of memory in MB"
  type        = number
}

variable "guest_id" {
  description = "The guest VM ID, usually the VM (or VM template) guest ID"
  type        = string
}

variable "template_uuid" {
  description = "The UUID of the VM (or VM template) to clone"
  type        = string
}

# =============================================================================
# Networks
# =============================================================================

variable "network_id" {
  description = "The ID of the server (management) network"
}

variable "network_ip" {
  description = "Static IP addresse"
}

# =============================================================================
# Disk
# =============================================================================

variable "disk_system_label" {
  description = "The system disk name (label)"
  type        = string
  default     = "disk0"
}

variable "disk_system_size" {
  description = "The system disk dize in GB"
  type        = number
  default     = 126
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
