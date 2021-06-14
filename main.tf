provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "instances" {
  source = "./modules/instances"
  zone   = var.zone
}

module "storage" {
  source = "./modules/storage"
  project_id = var.project_id
}

module "network" {
  source  = "terraform-google-modules/network/google"
  version = "3.2.2"
  # insert the 3 required variables here
  network_name = "terraform-vpc"
  project_id = var.project_id
  routing_mode = "GLOBAL"
  subnets = [
    {
      subnet_name           = "subnet-01"
      subnet_ip             = "10.10.10.0/24"
      subnet_region         = var.region
    },
    {
      subnet_name           = "subnet-02"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = var.region
    }
  ]
}

terraform {
  backend "gcs" {
      bucket = var.project_id
      prefix = "terraform/state"
  }
}
