provider "vsphere" {
  version              = "~> 1.17"
  user                 = var.vcenter_user
  password             = var.vcenter_password
  vsphere_server       = var.vcenter_server
  allow_unverified_ssl = var.vcenter_insecure
}

provider "local" {
  version = "1.4.0"
}

/**
 ll ~/.terraform.d/plugins/darwin_amd64
.rwxr-xr-x 57M bhofmann  1 Jul  1:37 terraform-provider-rke_v1.0.1
*/
provider "rke" {
  version = "1.0.1"
}

provider "digitalocean" {
  version = "~> 1.15"
  token   = var.digitalocean_token
}

provider "kubernetes" {
  version = "1.10.0"

  host = rke_cluster.rancher_cluster.api_server_url

  client_certificate     = rke_cluster.rancher_cluster.client_cert
  client_key             = rke_cluster.rancher_cluster.client_key
  cluster_ca_certificate = rke_cluster.rancher_cluster.ca_crt

  load_config_file = false
}

provider "helm" {
  version = "1.0.0"

  kubernetes {
    host = rke_cluster.rancher_cluster.api_server_url

    client_certificate     = rke_cluster.rancher_cluster.client_cert
    client_key             = rke_cluster.rancher_cluster.client_key
    cluster_ca_certificate = rke_cluster.rancher_cluster.ca_crt

    load_config_file = false
  }
}

# Rancher2 bootstrapping provider
provider "rancher2" {
  version   = "1.9.0"
  api_url   = "https://${digitalocean_record.rancher.fqdn}"
  insecure  = true
  bootstrap = true
}