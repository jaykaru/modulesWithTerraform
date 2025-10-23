
output "Ossh_sg_id" {
  value = aws_security_group.web_server_sg.id
}

output "Osubnet_id" {
  value = aws_subnet.module_demo_subnet.id
}

output "Ovpc_id" {
  value = aws_vpc.module_demo_vpc.id
}