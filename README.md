# Terraform EC2 Instance Deployment

This project automates the deployment of an AWS EC2 instance using Terraform and provides the instance’s public IP as a command line output. The setup uses a modular structure, making it reusable and configurable for various environments.

## Features

- Deploys an EC2 instance on AWS.
- Outputs the instance's public IP, accessible directly from the command line.
- Configurable instance types and AMI selection.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An AWS account with programmatic access configured (access key and secret key).
- IAM role with sufficient permissions to launch EC2 instances.

## Project Structure

```plaintext
├── main.tf                 # Root configuration, calls the EC2 module
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

## Customization

The `instance_type` and `ami` variables can be customized by modifying the values in `main.tf` or by adding a `variables.tf` file for more flexible configuration.

## Cleanup

To delete the created resources, use:
```bash
terraform destroy
```
Confirm with `yes` to remove all resources created by this configuration.
