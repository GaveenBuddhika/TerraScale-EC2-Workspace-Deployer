# Terraform EC2 Instance Deployment

This project automates the deployment of an AWS EC2 instance using Terraform and provides the instance’s public IP as a command line output. The setup uses a modular structure, making it reusable and configurable for various environments.

## Features

- Deploys an EC2 instance on AWS.
- Outputs the instance's public IP, accessible directly from the command line.
- Configurable instance types and AMI selection.
- GitHub Actions for CI/CD to automate deployment.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An AWS account with programmatic access configured (access key and secret key).
- IAM role with sufficient permissions to launch EC2 instances.

## Project Structure

```plaintext
├── main.tf                 # Root configuration, calls the EC2 module            #
├── .github/
│   └── workflows/
│       └── terraform.yml   # GitHub Actions workflow for Terraform
├── modules/
│   └── ec2-instance/
│       ├── main.tf         # Defines the EC2 instance resource
│       ├── variables.tf    # Module-specific variable declarations
│       └── outputs.tf      # Outputs public IP for the instance
```

## Usage

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```

2. **Apply the Configuration**:
   Run the following command to deploy the EC2 instance.
   ```bash
   terraform apply
   ```
   Confirm the changes by typing `yes` when prompted.

3. **Retrieve the Public IP**:
   After deployment, view the public IP directly:
   ```bash
   terraform output ec2_public_ip
   ```

## GitHub Actions

This project includes a GitHub Actions workflow to automate Terraform tasks. The workflow is defined in `.github/workflows/terraform.yml` and performs the following steps:

- **Checkout code**: Retrieves the latest version of the repository.
- **Setup Terraform**: Installs the specified version of Terraform.
- **Terraform Init**: Initializes the Terraform configuration.
- **Terraform Validate**: Validates the Terraform configuration files.
- **Terraform Plan**: Creates an execution plan for the changes.
- **Terraform Apply**: Automatically applies the changes to the infrastructure when changes are pushed to the `main` branch.

## Customization

The `instance_type` and `ami` variables can be customized by modifying the values in `main.tf` or by adding a `variables.tf` file for more flexible configuration.

## Cleanup

To delete the created resources, use:
```bash
terraform destroy
```
Confirm with `yes` to remove all resources created by this configuration.
