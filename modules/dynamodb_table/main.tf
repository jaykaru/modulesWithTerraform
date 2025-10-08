resource "aws_dynamodb_table" "terrform_lock" {
  name         = var.terrform_lock_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}