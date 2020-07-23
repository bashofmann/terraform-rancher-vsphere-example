# Rancher2 administration provider
provider "rancher2" {
  version    = "1.9.0"
  api_url    = "https://rancher-vsphere-demo.plgrnd.be"
  insecure   = true
  access_key = var.rancher_access_key
  secret_key = var.rancher_secret_key
}