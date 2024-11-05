provider "aws" {
  region = "eu-west-2"
}

variable "instance_type" {
  description = "value"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t2.xlarge"
  }
}

# Call the module and pass variable values
module "ec2_instance" {
  source      = "./modules/ec2_instance"
  ami         = "ami-0acc77abdfc7ed5a6" # Pass the AMI ID
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}

output "ec2_instance_public_ip" {
  value = module.ec2_instance.public-ip-address
}  