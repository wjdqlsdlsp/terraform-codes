module "cluster" {
  source = "../module/google-kubernetes-engine"

  ip_range_pods     = ""
  ip_range_services = ""
  name              = "timiddev-cluster"
  network           = "default"
  project_id        = "sharp-voyage-345407"
  subnetwork        = "default"
  region            = "us-east1"
  zones             = ["us-east1-b"]
  regional          = false
  remove_default_node_pool = true
  node_pools = [
    {
      name         = "pool-1"
      machine_type = "e2-micro"
      autoscaling  = false
      node_count   = 1
      disk_size_gb = 32
      disk_type    = "pd-balanced"
      auto_upgrade = true
    },
    {
      name = "pool-2"
      machine_type = "e2-standard-2"
      autoscaling  = false
      node_count   = 1
      disk_size_gb = 32
      disk_type    = "pd-balanced"
      auto_upgrade = true
      spot = true
    },
    {
      name         = "pool-3"
      machine_type = "e2-micro"
      autoscaling  = false
      node_count   = 0
      disk_size_gb = 32
      disk_type    = "pd-balanced"
      auto_upgrade = true
      spot = true
    },
  ]
}