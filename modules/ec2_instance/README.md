# EC2 Instance Terraform Module

This module provisions an AWS EC2 instance with configurable parameters.

## Usage

```hcl
module "ec2_instance" {
    source  = "./modules/ec2_instance"

    ami           = "ami-xxxxxxxx"
    instance_type = "t2.micro"
    subnet_id     = "subnet-xxxxxxxx"
    key_name      = "my-key"
    tags = {
        Name = "MyEC2Instance"
    }
}
```

## Inputs

| Name           | Description                   | Type     | Default      | Required |
|----------------|------------------------------|----------|--------------|----------|
| ami            | AMI ID for the instance      | string   | n/a          | yes      |
| instance_type  | EC2 instance type            | string   | "t2.micro"   | no       |
| subnet_id      | Subnet ID                    | string   | n/a          | yes      |
| key_name       | Key pair name                | string   | n/a          | yes      |
| tags           | Tags for the instance        | map      | {}           | no       |

## Outputs

| Name           | Description                   |
|----------------|------------------------------|
| instance_id    | The ID of the EC2 instance   |
| public_ip      | Public IP address            |
| private_ip     | Private IP address           |

## Example

See [examples/](../../examples/) for usage examples.

