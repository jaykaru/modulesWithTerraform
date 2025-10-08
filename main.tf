module "ec2_instance" {
  source              = "./modules/ec2_instance"
  ami_value           = var.ami_value
  instance_type_value = var.instance_type_value
}

# module "ec2-instance" {
#   source        = "terraform-aws-modules/ec2-instance/aws"
#   version       = "6.1.1"
#   instance_type = "t3.micro"
#   ami           = "ami-046c2381f11878233"
#   subnet_id = "subnet-037fc7309c3dcd018"
#   name = "my-instance"

# }

module "s3_bucket" {
  source            = "./modules/s3_bucket"
  state_bucket_name = var.state_bucket_name
}

module "dynamodb_table" {
  source        = "./modules/dynamodb_table"
  terrform_lock_name = var.terrform_lock_name
}