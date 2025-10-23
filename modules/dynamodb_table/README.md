# DynamoDB Table Terraform Module

This module provisions an AWS DynamoDB table using Terraform.

## Usage

```hcl
module "dynamodb_table" {
    source = "./modules/dynamodb_table"

    table_name        = "example-table"
    hash_key          = "id"
    billing_mode      = "PAY_PER_REQUEST"
    attributes = [
        {
            name = "id"
            type = "S"
        }
    ]
    tags = {
        Environment = "dev"
        Project     = "BenchProject"
    }
}
```

## Inputs

| Name         | Description                | Type    | Default           | Required |
|--------------|----------------------------|---------|-------------------|----------|
| table_name   | Name of the DynamoDB table | string  | n/a               | yes      |
| hash_key     | Hash key attribute name    | string  | n/a               | yes      |
| billing_mode | Billing mode               | string  | "PAY_PER_REQUEST" | no       |
| attributes   | Table attributes           | list    | n/a               | yes      |
| tags         | Resource tags              | map     | {}                | no       |

## Outputs

| Name      | Description                |
|-----------|----------------------------|
| table_id  | DynamoDB table ID          |
| table_arn | DynamoDB table ARN         |

