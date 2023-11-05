module "project_billing" {
  source = "./modules/project_billing"

  project_id      = var.project_id
  billing_account = var.billing_account
}

module "compute_network" {
  source = "./modules/compute_network"

  project_id = var.project_id
  vm_username = var.vm_username
  storage_bucket_name = module.storage.name
  service_account_email = module.iam.service_account_email

  depends_on = [ module.iam ]
  
}

module "iam" {
  source = "./modules/iam"

  project_id = var.project_id
  storage_bucket_name = module.storage.name
  
  depends_on = [ module.storage ]

}

module "storage" {
  source = "./modules/storage"
  project_id = var.project_id

  depends_on = [ module.project_billing ]
}











