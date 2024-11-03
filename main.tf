provider "aws" {
  region = "eu-west-2"
}

# Call the module and pass variable values
module "ec2_instance" {
  source      = "./modules/ec2_instance"
  ami         = "ami-0acc77abdfc7ed5a6" # Pass the AMI ID
  environment = "dev" # Pass the environment
  instance_type = lookup(
    {
      "dev"  = "t3.micro"
      "test" = "t2.micro"
      "prod" = "t3.medium"
    },
    "dev",
    "t3.micro" # Default instance type if environment is not found
  )
}

output "ec2_instance_public_ip" {
  value = module.ec2_instance.public-ip-address
}