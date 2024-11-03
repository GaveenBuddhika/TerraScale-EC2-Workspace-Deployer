provider "aws" {
  region = "eu-north-1"
}

# Call the module and pass variable values
module "ec2_instance" {
  source      = "./modules/ec2-instance"
  ami         = var.ami  # Pass the AMI ID
  environment = var.environment # Pass the environment
  instance_type = lookup(
    {
      "dev"  = "t3.micro"
      "test" = "t2.micro"
      "prod" = "t3.medium"
    },
    var.environment,
    "t3.micro" # Default instance type if environment is not found
  )
}