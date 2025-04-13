variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "zone" {
  description = "The GCP zone"
  type        = string
}

variable "machine_type" {
  description = "Machine type for GKE nodes"
  type        = string
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "node_count" {
  description = "Initial number of nodes in the cluster"
  type        = number
}
