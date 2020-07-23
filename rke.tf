resource "rke_cluster" "rancher_cluster" {
  cluster_name = "quickstart-rancher-server"

  nodes {
    address          = vsphere_virtual_machine.rancher_server[0].default_ip_address
    user             = local.node_username
    role             = ["controlplane", "etcd", "worker"]
    ssh_key          = file(var.ssh_key_file_name)
  }
  nodes {
    address          = vsphere_virtual_machine.rancher_server[1].default_ip_address
    user             = local.node_username
    role             = ["controlplane", "etcd", "worker"]
    ssh_key          = file(var.ssh_key_file_name)
  }
  nodes {
    address          = vsphere_virtual_machine.rancher_server[2].default_ip_address
    user             = local.node_username
    role             = ["controlplane", "etcd", "worker"]
    ssh_key          = file(var.ssh_key_file_name)
  }

  kubernetes_version = var.rke_kubernetes_version
}
