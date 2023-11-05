variable "project_id" {
    description = "Project ID of the Project where the VM should be deployed"
    type = string
    default = "hostovpnserver69"
}

variable "billing_account" {
    description = "Billing Account to link to the Project"
    type = string
}

variable "name" {
    description = "Name of the compute instance"
    type        = string
    default = "vm-openvpn"
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

variable "vm_username" {
    description = "Username of the user that will be created on the VM"
    type        = string
}
