# GKE Infrastructure with Terraform and Argo CD

This repository provisions Google Cloud infrastructure using Terraform, including:

- A GKE (Google Kubernetes Engine) cluster
- Argo CD for GitOps-based Kubernetes deployments
- Supporting networking and IAM resources

---

## 🚀 Features

- GKE cluster provisioning with secure node pools
- Argo CD installed via Helm
- Modular Terraform structure
- Environment separation (`dev`, `staging`, `prod`)
- Optional GCS remote backend for shared Terraform state

---

## 🧱 Project Structure

```bash
.
├── environments/
│   ├── dev/
│   │   ├── backend.tf           # Remote state configuration (e.g., GCS)
│   │   ├── main.tf              # Environment-specific resources
│   │   ├── terraform.tfvars     # Variables for dev environment
│   │   └── variables.tf         # Input variable declarations
│   ├── staging/
│   └── prod/
│
├── modules/gke/
│   ├── main.tf              # GKE cluster and node pools
│   ├── outputs.tf           # Output values like cluster name
│   └── variables.tf         # Input variables for GKE module
│
├── main.tf                      # Root module (optional)
├── outputs.tf                   # Shared outputs
├── providers.tf                 # Google, Kubernetes, Helm providers
├── variables.tf                 # Shared input variables
├── terraform.tfvars             # Default input values (optional)
└── README.md
```

📋 Prerequisites
Terraform v1.5+

Google Cloud SDK (gcloud)

GCP Project with billing enabled

gcloud auth application-default login

⚙️ Setup Instructions
1. Authenticate with GCP
```bash
gcloud auth application-default login
gcloud config set project <your-gcp-project-id>
```

3. Deploy the Dev Environment
```bash
cd environments/dev
terraform init
terraform apply
```

🔁 Argo CD Bootstrapping
Once Argo CD is provisioned:

Access Argo CD UI
```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
Open: https://localhost:8080

Retrieve Initial Admin Password

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d


🧠 Notes
Argo CD syncs with your [Go test app repo](https://github.com/esketch545/my-go-gopher/tree/main) to deploy Kubernetes manifests from the k8s/ folder.

Each environment (dev, staging, prod) can have separate Argo CD Application definitions.

Use terraform.tfvars files to define environment-specific values like cluster name, node count, etc.

🪪 License
MIT © Evan Sketch