output "client_ovpn_url" {
  value = "https://storage.cloud.google.com/${google_storage_bucket.openvpn_bucket.name}/client.ovpn"
}

output "name" {
  value = google_storage_bucket.openvpn_bucket.name
  
}