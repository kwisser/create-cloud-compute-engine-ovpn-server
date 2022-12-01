variable "project_id" {
    description = "Project ID of the Project where the VM should be deployed"
    type = string
    default = "host-openvpn-server"
}

variable "machine_type" {
    description = "Machine Type of the VM Instance"
    type = string
    default = "f1-micro"
}
