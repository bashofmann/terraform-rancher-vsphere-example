

# Create cattle-system namespace for Rancher
resource "kubernetes_job" "create_cattle_system_ns" {
  metadata {
    name      = "create-cattle-system-ns"
    namespace = "kube-system"
  }
  spec {
    template {
      metadata {}
      spec {
        container {
          name    = "hyperkube"
          image   = "rancher/hyperkube:${local.hyperkube_tag}"
          command = ["kubectl", "create", "namespace", "cattle-system"]
        }
        host_network                    = true
        automount_service_account_token = true
        service_account_name            = kubernetes_service_account.cert_manager_crd.metadata[0].name
        restart_policy                  = "Never"
      }
    }
  }
}

# Install Rancher helm chart
resource "helm_release" "rancher_server" {
  depends_on = [
    helm_release.cert_manager,
  ]

  repository = data.helm_repository.rancher_latest.metadata[0].name
  name       = "rancher"
  chart      = "rancher"
  version    = "2.4.5"
  namespace  = "cattle-system"

  set {
    name  = "hostname"
    value = "rancher-vsphere-demo.plgrnd.be"
  }

  set {
    name  = "certmanager.version"
    value = "0.12.0"
  }
}

# Initialize Rancher server
resource "rancher2_bootstrap" "admin" {
  depends_on = [
    helm_release.rancher_server
  ]
  password  = var.rancher_admin_password
  telemetry = true
}