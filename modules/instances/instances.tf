resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "n1-standard-1"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20210609"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true    

}
resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "n1-standard-1"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20210609"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
  allow_stopping_for_update = true    

}