variable "project_id" {
    description = "Project ID of the Project where the VM should be deployed"
    type = string
    default = "host-my-openvpn-server"
}

variable "storage_bucket_name" {
    description = "Name of the Storage Bucket to safe the client.ovpn file"
    type        = string
}