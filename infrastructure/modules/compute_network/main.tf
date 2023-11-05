resource "google_compute_instance" "default" {
  project      = var.project_id
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  
    access_config {
      // Ephemeral public IP
    }
  }
    metadata = {
    startup-script = <<-EOF
    sudo apt-get update && mkdir -p /home/${var.vm_username} &&
    cd /home/${var.vm_username} &&
    curl -O https://raw.githubusercontent.com/kwisser/create-cloud-compute-engine-ovpn-server/main/openvpn-install.sh && 
    chmod +x openvpn-install.sh && sudo AUTO_INSTALL=y ./openvpn-install.sh &&
    mv /root/client.ovpn /home/${var.vm_username} &&
    gsutil cp /home/${var.vm_username}/client.ovpn gs://${var.storage_bucket_name}/client.ovpn
  EOF
  }

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }

}

resource "google_compute_firewall" "default" {
  project = var.project_id
  name    = "openvpn"
  network = "default"

  allow {
    protocol = "udp"
    ports    = ["1194"]
  }
  source_ranges = ["0.0.0.0/0"]

}