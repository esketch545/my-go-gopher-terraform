# # outputs.tf

# output "cluster_name" {
#   description = "The name of the GKE cluster"
#   value       = google_container_cluster.primary.name
# }

# output "argocd_namespace" {
#   description = "The name of the ArgoCD namespace"
#   value       = kubernetes_namespace.argocd.metadata[0].name
# }
