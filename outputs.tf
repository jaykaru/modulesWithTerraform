output "instance_id" {
  value       = module.ec2_instance.instance_id
  description = "ID of the EC2 instance"
}

output "public_ip" {
  value       = module.ec2_instance.public_ip
  description = "Public IP of the EC2 instance"
}


