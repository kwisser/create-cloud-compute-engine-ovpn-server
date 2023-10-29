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
```

## Step 2: Choose a Zone for Your VPN Location

Select a suitable zone for deploying the VM instance. The choice of zone can affect the latency and speed of your VPN. You can find a list of available regions and zones on GCP [here](https://cloud.google.com/compute/docs/regions-zones?hl=de#available).

## Step 3: Execute Terraform Scripts

Navigate to the infrastructure directory and initialize Terraform. This will download the necessary provider plugins.

```bash
cd infrastructure
terraform init
```

Now, plan and apply the Terraform configuration. This will show the resources that will be created and apply the changes, respectively.

```bash
terraform plan
terraform apply
```

Upon successful execution, a client.ovpn file will be generated in the user directory. This file can be used to connect to the VPN server from a client machine.

### Credits
The OpenVPN installation script is sourced from [angristan/openvpn-install](https://github.com/angristan/openvpn-install).

Support & Contributions
For issues, or contributions, feel free to open a pull request or create an issue in the repository.

This setup allows you to have a personal VPN server hosted on GCP with minimal setup. Enjoy secure and private browsing!
