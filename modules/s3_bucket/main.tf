resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = var.state_bucket_name
}