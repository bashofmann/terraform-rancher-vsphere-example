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

variable "vm_template_name" {
  type = string
  default = "bhofmann-ubuntu-18.04-server-cloudimg-amd64"
}

variable "rancher_access_key" {
  type    = string
  default = null
}
variable "rancher_secret_key" {
  type    = string
  default = null
}