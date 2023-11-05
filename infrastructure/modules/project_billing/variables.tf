variable "project_id" {
    description = "Project ID of the Project where the VM should be deployed"
    type = string
    default = "host-my-openvpn-server"
}

variable "billing_account" {
    description = "Billing Account to link to the Project"
    type = string
}