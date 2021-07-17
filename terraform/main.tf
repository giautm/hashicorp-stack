data "google_client_config" "default" {}

provider "google" {
  project = var.google_project
  region  = var.region
}

provider "kubernetes" {
  host  = google_container_cluster.engineering.endpoint
  token = data.google_client_config.default.access_token

  cluster_ca_certificate = base64decode(google_container_cluster.engineering.master_auth.0.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host  = google_container_cluster.engineering.endpoint
    token = data.google_client_config.default.access_token

    cluster_ca_certificate = base64decode(google_container_cluster.engineering.master_auth.0.cluster_ca_certificate)
  }
}
