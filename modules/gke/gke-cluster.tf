# resources/gke-cluster.tf

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.zone
  initial_node_count = var.node_count
  node_config {
    preemptible  = true
    machine_type = var.machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
  enable_legacy_abac = false
  network = "default"
  deletion_protection = false
}
