resource "google_storage_bucket" "openvpn_bucket" {
  project     = var.project_id
  name        = "${var.project_id}-bucket"
  location    = "EU"

}