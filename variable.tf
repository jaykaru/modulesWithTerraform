variable "ami_value" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_type_value" {
  description = "The type of instance to use"
  type        = string
}

variable "state_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "terrform_lock_name" {
  description = "The name of the DynamoDB table"
  type        = string
}