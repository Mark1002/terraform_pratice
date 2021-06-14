provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "instances" {
  source = "./modules/instances"
  machine_type = "n1-standard-2"
  zone   = var.zone
}

module "storage" {
  source = "./modules/storage"
  project_id = var.project_id
}

terraform {
  backend "gcs" {
      bucket = var.project_id
      prefix = "terraform/state"
  }
}
