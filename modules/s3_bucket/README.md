# S3 Bucket Terraform Module

This module creates and manages an AWS S3 bucket with configurable options.

## Usage

```hcl
module "s3_bucket" {
    source = "./modules/s3_bucket"

    bucket_name = "my-example-bucket"
    versioning  = true
    tags = {
        Environment = "dev"
        Project     = "BenchProject"
    }
}
```

## Inputs

| Name        | Description                  | Type    | Default | Required |
|-------------|------------------------------|---------|---------|----------|
| bucket_name | Name of the S3 bucket        | string  | n/a     | yes      |
| versioning  | Enable versioning            | bool    | false   | no       |
| tags        | Tags to apply to the bucket  | map     | {}      | no       |

## Outputs

| Name         | Description                |
|--------------|----------------------------|
| bucket_id    | The ID of the S3 bucket    |
| bucket_arn   | The ARN of the S3 bucket   |
| bucket_name  | The name of the S3 bucket  |



