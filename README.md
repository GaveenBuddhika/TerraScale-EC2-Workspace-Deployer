
# Terraform AWS EC2 Instance Deployment

This project automates the deployment of an AWS EC2 instance using Terraform, with modular support for configuring different environments. The setup utilizes GitHub Actions to automate deployment for each branch, creating isolated Terraform workspaces for `dev`, `stage`, and `prod` environments.

## Project Structure

- **Production Branch (`prod`)**: Used for production-ready deployments.
- **Development Branch (`dev`)**: Used for testing and developing new features.
- **Staging Branch (`stage`)**: Used for QA and staging purposes.

## Features

- Modularized Terraform code for reusable configurations
- Dynamic workspace creation based on branches (`prod`, `dev`, `stage`)
- GitHub Actions workflow to handle automatic deployment on each branch
- Outputs the public IP of the EC2 instance

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- AWS account with IAM user and access keys configured in GitHub Secrets
- [GitHub CLI](https://cli.github.com/) (optional for branch creation and management)

## Environment Setup

### AWS Credentials

Add the following secrets to your GitHub repository:
- **AWS_ACCESS_KEY_ID**: Your IAM user’s access key ID.
- **AWS_SECRET_ACCESS_KEY**: Your IAM user’s secret access key.
- **AWS_REGION**: Desired AWS region (e.g., `us-west-2`).

### GitHub Actions Workflow

The GitHub Actions workflow will:
1. Configure AWS credentials.
2. Initialize and validate Terraform.
3. Dynamically create or select a Terraform workspace based on the branch name.
4. Plan and apply the Terraform configuration.

## Running the Workflow

1. **Manual Trigger**: Go to **Actions > Terraform Workflow** and select **Run workflow**. Choose the desired branch (e.g., `dev` or `stage`).
2. **Automatic Trigger**: The workflow runs on pushes and pull requests to `prod`, `dev`, and `stage`.

---

## Branch-specific Configurations

Each branch represents an isolated environment:
- `prod`: Production, using the `t3.medium` instance type.
- `dev`: Development, using the `t3.micro` instance type.
- `stage`: Staging, using the `t3.nano` instance type.

### Variables and Outputs

The EC2 instance's public IP is output after `terraform apply`, and you can retrieve it from the GitHub Actions job summary.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
