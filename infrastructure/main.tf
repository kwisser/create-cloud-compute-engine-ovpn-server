resource "google_compute_instance" "default" {
  project      = var.project_id
  name         = var.name
  machine_type = var.machine_type
  zone         = "europe-west1-b"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }


  network_interface {
    network = "default"
  
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = "sudo apt-get update && sudo apt-get upgrade -y && curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh chmod +x openvpn-install.sh && sudo AUTO_INSTALL=y ./openvpn-install.sh"
}

resource "google_compute_firewall" "default" {
  project = var.project_id
  name    = "ovpn-firewall"
  network = "default"

  allow {
    protocol = "udp"
    ports    = ["1194"]
  }
  
  source_ranges = ["0.0.0.0/0"]
}
