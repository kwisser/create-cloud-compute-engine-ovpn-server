resource "google_service_account" "openvpn_service_account" {
  project      = var.project_id
  account_id   = "openvpn-service-account"
  display_name = "OpenVPN Service Account"

}

resource "google_project_iam_binding" "openvpn_storage_binding" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"

  members = [
    "serviceAccount:${google_service_account.openvpn_service_account.email}",
  ]

}

resource "google_storage_bucket_iam_binding" "openvpn_bucket_iam" {
  bucket = var.storage_bucket_name
  role   = "roles/storage.objectAdmin"
  members = [
    "serviceAccount:${google_service_account.openvpn_service_account.email}",
  ]

}