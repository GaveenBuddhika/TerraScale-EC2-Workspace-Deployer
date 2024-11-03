# Variable for AMI ID
variable "ami" {
  description = "The AMI ID to use for the instance"
  type        = string
}

# Variable for instance type
variable "instance_type" {
  description = "The type of EC2 instance to use"
  type        = string
}


