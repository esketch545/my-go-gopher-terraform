data "google_client_config" "default" {}

output "kubeconfig" {
  value = {
    host                   = google_container_cluster.primary.endpoint
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
  }
}
