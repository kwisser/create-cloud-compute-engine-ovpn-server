output "internal_ip" {
    value = module.compute_network.internal_ip
}

output "external_ip" {
    value = module.compute_network.external_ip
}

output "client_ovpn_url" {
  value = module.storage.client_ovpn_url
}

output "storage_bucket_name" {
  value = module.storage.name
}