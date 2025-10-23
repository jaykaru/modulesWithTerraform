# terraform {
#   backend "s3" {
#     bucket = "jk-terraform-state-bucket-12345"
#     key    = "jkstatefile/terraform.tfstate"
#     region = "eu-west-2"
#     dynamodb_table = "terraform-lock-table"
#     # encrypt = true
#   }
# }

