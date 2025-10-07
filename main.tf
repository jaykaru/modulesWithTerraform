module "ec2_instance" {
  source              = "./modules/ec2_instance"
  ami_value           = "ami-046c2381f11878233"
  instance_type_value = "t3.micro"
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
  source = "./modules/s3_bucket"
  state_bucket = "jk-terraform-state-bucket-12345"
}