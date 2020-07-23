resource "rancher2_cluster" "demo" {
  name        = "demo-cluster"
  description = "Cluster for demos"
  rke_config {
    kubernetes_version = "v1.18.3-rancher2-2"
    network {
      plugin = "canal"
    }
    services {
      etcd {
        creation  = "6h"
        retention = "24h"
      }
    }
    upgrade_strategy {
      drain                  = false
      max_unavailable_worker = "20%"
    }
  }
  scheduled_cluster_scan {
    enabled = true
    scan_config {
      cis_scan_config {
        override_benchmark_version = "rke-cis-1.4"
        profile                    = "permissive"
      }
    }
    schedule_config {
      cron_schedule = "30 * * * *"
      retention     = 5
    }
  }
}

resource "rancher2_node_pool" "demo-nodes" {
  cluster_id       = rancher2_cluster.demo.id
  name             = "demo-nodes"
  hostname_prefix  = "demo-nodes"
  node_template_id = rancher2_node_template.mytemplate.id
  quantity         = 3
  control_plane    = true
  etcd             = true
  worker           = true
}

resource "rancher2_cluster_sync" "demo" {
  cluster_id = rancher2_cluster.demo.id
  node_pool_ids = [
    rancher2_node_pool.demo-nodes.id
  ]
}