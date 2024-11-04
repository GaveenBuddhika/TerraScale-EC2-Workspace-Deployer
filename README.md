
# Terraform AWS EC2 Instance Deployment - Dev Branch

This branch represents the **development environment** for testing new configurations and features.

## Configuration

- **Instance Type**: `t3.micro`
- **Region**: Defined in `aws_region` environment variable
- **GitHub Actions**: Automatically applies Terraform changes on the `dev` branch.

## Usage

Any changes pushed to this branch will trigger a Terraform deployment through GitHub Actions, using the `dev` Terraform workspace.
