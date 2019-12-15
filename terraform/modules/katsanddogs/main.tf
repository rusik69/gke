resource "google_storage_bucket" "katsanddogs" {
  name     = "katsanddogs"
  location = "US"
}

module "gke" {
  source            = "terraform-google-modules/kubernetes-engine/google"
  project_id        = "decent-tracer-255319"
  name              = "katsanddogs-prod"
  regional          = false
  region            = "europe-west1"
  zones             = ["europe-west1-b"]
  network           = "katsanddogs"
  subnetwork        = "katsanddogs-prod"
  ip_range_pods     = "katsanddogs-prod-pods"
  ip_range_services = "katsanddogs-prod-services"
  service_account   = "create"
  logging_service   = "none"
  http_load_balancing	= false

 node_pools = [
    {
      name               = "default-node-pool"
      machine_type       = "g1-small"
      min_count          = 3
      max_count          = 3
      disk_size_gb       = 10
      disk_type          = "pd-standard"
      image_type         = "COS"
      auto_repair        = true
      auto_upgrade       = true
      preemptible        = true
      initial_node_count = 3
    },
  ]
}