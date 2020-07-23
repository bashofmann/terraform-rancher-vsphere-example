locals {
  node_username = "ubuntu"
}

variable "ssh_key_file_name" {
  type        = string
  description = "File path and name of SSH private key used for infrastructure and RKE"
  default     = "~/.ssh/id_rsa"
}

variable "docker_version" {
  type        = string
  description = "Docker version to install on nodes"
  default     = "19.03"
}


// Number of vCPUs to assign to worker nodes
variable "node_num_cpus" {
  default = "2"
}

// Memory size in MB to assign to worker nodes
variable "node_memory_mb" {
  default = "4096"
}

variable "vm_template_name" {
  type = string
  default = "bhofmann-ubuntu-18.04-server-cloudimg-amd64"
}

variable "rke_kubernetes_version" {
  type        = string
  description = "Kubernetes version to use for Rancher server RKE cluster"
  default     = "v1.18.3-rancher2-2"
}

variable "digitalocean_token" {
  type = string
}

variable "vcenter_user" {
  type = string
}

variable "vcenter_password" {
  type = string
}

// vCenter server FQDN or IP address
variable "vcenter_server" {
  type = string
}

// Skip certificate verification
variable "vcenter_insecure" {
  default = false
}

# vSphere datacenter to use
variable "vsphere_datacenter" {
  type = string
}

# vSphere cluster to use (required unless vsphere_resource_pool is specified)
variable "vsphere_cluster" {
  type    = string
  default = ""
}

# vSphere resource pool to use (required unless vsphere_cluster is specified)
variable "vsphere_resource_pool" {
  type    = string
  default = ""
}

# Name/path of datastore to use
variable "vsphere_datastore" {
  type = string
}

# VM Network to attach the VMs
variable "vsphere_network" {
  type = string
}

variable "rancher_admin_password" {
  type = string
}