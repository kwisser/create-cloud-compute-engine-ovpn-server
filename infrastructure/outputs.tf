output "internal_ip" {
    value = google_compute_instance.default.network_interface.0.network_ip
}

output "external_ip" {
    value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}

output "client_ovpn_url" {
  value = "https://storage.cloud.google.com/${google_storage_bucket.openvpn_bucket.name}/client.ovpn"
}