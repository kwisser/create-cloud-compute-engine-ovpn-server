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
