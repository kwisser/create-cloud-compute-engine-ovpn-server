variable "project_id" {
    description = "Project ID of the Project where the VM should be deployed"
    type = string
    default = "host-my-openvpn-server"
}

variable "name" {
    description = "Name of the compute instance"
    type        = string
    default = "vm-openvpn"
}

variable "vm_username" {
    description = "Username of the user that will be created on the VM"
    type        = string
}

variable "machine_type" {
    description = "Machine Type of the VM Instance"
    type        = string
    default     = "f1-micro"
}

variable "zone" {
    description = "Zone of the VM Instance"
    type        = string
    default = "europe-west1-b"
}

variable "storage_bucket_name" {
    description = "Name of the Storage Bucket to safe the client.ovpn file"
    type        = string
}

variable "service_account_email" {
    description = "Email of the Service Account being used by the VM Instance "
    type        = string
}