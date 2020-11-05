provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  version = "~> 3.18"
}