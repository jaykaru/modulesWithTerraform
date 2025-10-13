# -------------------------------
# VPC 
# -------------------------------

resource "aws_vpc" "module_demo_vpc" {
  cidr_block = var.vpc_cidr_block_value
  tags = merge(var.global_tags,var.vpc_tag)
}

# -------------------------------
# Subnet
# -------------------------------

resource "aws_subnet" "module_demo_subnet" {
  vpc_id            = aws_vpc.module_demo_vpc.id
  cidr_block        = var.subnet_cidr_block_value
  availability_zone = var.availability_zone_name
  map_public_ip_on_launch = var.map_public_ip_on_launch 
  tags = merge(var.global_tags,var.subnet_tag)
  
}

# -------------------------------
# Internet Gateway
# -------------------------------

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.module_demo_vpc.id
  tags = merge(var.global_tags,var.igw_name_tag)
}


# -------------------------------
# Route Table & Route Table Association
# -------------------------------

resource  "aws_route_table" "rt1" {
  vpc_id = aws_vpc.module_demo_vpc.id
  route {
    cidr_block = var.route_cidr_block_value
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(var.global_tags,var.rt1_tag)
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.module_demo_subnet.id
  route_table_id = aws_route_table.rt1.id
}

# -------------------------------
# Security Group
# -------------------------------

resource "aws_security_group" "web_server_sg" {
  name        = var.security_group_name
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.module_demo_vpc.id
  tags = merge(var.global_tags,var.security_group_tag)

 
# dynamic "ingress" creates multiple ingress blocks dynamically.
# for_each = var.ingress_rules loops through the list of objects.
# ingress.value refers to the current rule in the loop.
dynamic "ingress" {
  for_each = [for rule in var.security_group_rules : rule if rule.type == "ingress"]
  content {
    from_port   = ingress.value.from_port
    to_port     = ingress.value.to_port
    protocol    = ingress.value.protocol
    cidr_blocks = ingress.value.cidr_blocks
    description = ingress.value.description
  }
}

dynamic "egress" {
  for_each = [for rule in var.security_group_rules : rule if rule.type == "egress"]
  content {
    from_port   = egress.value.from_port
    to_port     = egress.value.to_port
    protocol    = egress.value.protocol
    cidr_blocks = egress.value.cidr_blocks
    description = egress.value.description
  }
}

// The below method  sepearte ingress and egress lists
# dynamic "ingress" {
#   for_each = var.security_group_rules.ingress
#   content {
#     from_port   = ingress.value.from_port
#     to_port     = ingress.value.to_port
#     protocol    = ingress.value.protocol
#     cidr_blocks = ingress.value.cidr_blocks
#   }
# }

# dynamic "egress" {
#   for_each = var.security_group_rules.egress
#   content {
#     from_port   = egress.value.from_port
#     to_port     = egress.value.to_port
#     protocol    = egress.value.protocol
#     cidr_blocks = egress.value.cidr_blocks
#   }
# }

}


