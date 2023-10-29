## Setting up a VPS Server with OpenVPN on GCP using Terraform

This guide walks through the process of setting up a Virtual Private Server (VPS) with OpenVPN on Google Cloud Platform (GCP) using Terraform. The provided Terraform script will automate the provisioning of a Google Compute Engine instance, and the installation of OpenVPN server on it. Upon successful execution, a `client.ovpn` configuration file will be generated in the user directory, which can be used to connect to the VPN server from a client machine.

### Pre-requisites

- Ensure you have [Terraform installed](https://www.terraform.io/downloads.html) on your machine.
- A Google Cloud Platform (GCP) account with necessary permissions to create resources.
- Git (Optional, for cloning the repository)

### Step 1: Clone the Repository

Clone the repository containing the Terraform scripts.

```bash
git clone https://github.com/kwisser/create-cloud-compute-engine-ovpn-server
cd create-cloud-compute-engine-ovpn-server/infrastructure

## How to Setup

### Choose the zone for your vpn location

<https://cloud.google.com/compute/docs/regions-zones?hl=de#available>

### Execute Terraform

`cd infrastructure` \
`terraform init` \
`terraform plan` \
`terraform apply`
