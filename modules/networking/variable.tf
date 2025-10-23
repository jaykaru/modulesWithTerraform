
# -------------------------------
# Variable Tags
# -------------------------------
variable "global_tags" {
  description = "Global tags applied to all resources"
  type        = map(string)
}

variable "vpc_tag" {
  description = "A tag assigned to a  VPC module_demo_vpc"
  type        = map(string)
}

variable "subnet_tag" {
  description = "A tag for subnet module_demo_subnet"
  type        = map(string)
}

variable "rt1_tag" {
  description = "A tag assigned to a route_table rt1"
  type        = map(string)
}

variable "igw_name_tag" {
  description = "The name the Internet Gateway"
  type        = map(string)
}

variable "security_group_tag" {
  description = "A tag assigned to a security group"
  type        = map(string)
}

# -------------------------------
# Variable Resources
# -------------------------------

variable "vpc_cidr_block_value" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr_block_value" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "route_cidr_block_value" {
  description = "The CIDR block for the route"
  type        = string
}

variable "availability_zone_name" {
  description = "The availability zone for the subnet"
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Whether to assign a public IP address to instances launched in the subnet"
  type        = bool
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
}

variable "security_group_rules" {
  description = "List of security group rules"
  type = list(object({
    type        = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string)
  }))

  // The below method  sepearte ingress and egress lists
# type = object({
#     ingress = list(object({
#       from_port   = number
#       to_port     = number
#       protocol    = string
#       cidr_blocks = list(string)
#     }))
#     egress = list(object({
#       from_port   = number
#       to_port     = number
#       protocol    = string
#       cidr_blocks = list(string)
#     }))
#   })
}

 
