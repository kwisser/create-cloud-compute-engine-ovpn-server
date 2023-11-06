resource "google_project" "my_project" {
  name       = var.project_id
  project_id = var.project_id
  billing_account = var.billing_account
}

resource "google_project_service" "compute_api" {
  project = var.project_id
  service = "compute.googleapis.com"

  depends_on = [ google_project.my_project ]
}

resource "google_service_account" "openvpn_service_account" {
  project      = var.project_id
  account_id   = "openvpn-service-account"
  display_name = "OpenVPN Service Account"

  depends_on = [ google_project_service.compute_api ]
}

resource "google_project_iam_binding" "openvpn_storage_binding" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"

  members = [
    "serviceAccount:${google_service_account.openvpn_service_account.email}",
  ]

  depends_on = [ google_service_account.openvpn_service_account ]
}


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
    gsutil cp /home/${var.vm_username}/client.ovpn gs://${google_storage_bucket.openvpn_bucket.name}/client.ovpn
  EOF
  }

  service_account {
    email  = google_service_account.openvpn_service_account.email
    scopes = ["cloud-platform"]
  }

  depends_on = [ google_project_service.compute_api ]
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

  depends_on = [ google_project_service.compute_api ]

}

resource "google_storage_bucket" "openvpn_bucket" {
  project     = var.project_id
  name        = "${var.project_id}-bucket"
  location    = "EU"  // Setzen Sie die gewünschte Region

  depends_on = [ google_project_service.compute_api ]
}

resource "google_storage_bucket_iam_binding" "openvpn_bucket_iam" {
  bucket = google_storage_bucket.openvpn_bucket.name
  role   = "roles/storage.objectAdmin"
  members = [
    "serviceAccount:${google_service_account.openvpn_service_account.email}",
  ]

  depends_on = [ google_storage_bucket.openvpn_bucket ]
}
