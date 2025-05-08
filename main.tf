provider "google" {
  project = var.project_id
  region  = var.region
}

provider "kubernetes" {
  host                   = module.gke_cluster.kubeconfig["host"]
  token                  = module.gke_cluster.kubeconfig["token"]
  cluster_ca_certificate = base64decode(module.gke_cluster.kubeconfig["cluster_ca_certificate"])
}

provider "helm" {
  kubernetes {
    host                   = module.gke_cluster.kubeconfig["host"]
    cluster_ca_certificate = base64decode(module.gke_cluster.kubeconfig["cluster_ca_certificate"])
    token                  = module.gke_cluster.kubeconfig["token"]
  }
}

module "gke_cluster" {
  source       = "./modules/gke"
  cluster_name = var.cluster_name
  zone         = var.zone
  machine_type = var.machine_type
  node_count   = var.node_count
  project_id   = var.project_id
}

resource "helm_release" "argocd_image_updater" {
  name       = "argocd-image-updater"
  namespace  = "argocd"
  create_namespace = true

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd-image-updater"
  version    = "1.0.0" # Ensure to use the latest stable version

  values = [
    file("${path.module}/values/argocd-image-updater-values.yaml")
  ]
}