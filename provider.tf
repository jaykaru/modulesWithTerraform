terraform {
  required_version = ">= 1.13.0" # Ensures Terraform CLI is at least version 1.13.0
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.15" # Allows 6.15.x updates but not 6.16 or higher
    }
  }
}

provider "aws" {
  region = var.region
}