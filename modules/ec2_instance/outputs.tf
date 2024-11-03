output "public-ip-address" {
  description = "The public IP address of the EC2 instance created by the module"
  value = aws_instance.example.public_ip
}