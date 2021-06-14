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

module "vpc" {
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

resource "google_compute_firewall" "tf-firewall" {
  name    = "tf-firewall"
  network = module.vpc.network_name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]

}

terraform {
  backend "gcs" {
      bucket = var.project_id
      prefix = "terraform/state"
  }
}
