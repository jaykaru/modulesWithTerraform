# Networking Module

This module provides resources to create and manage networking infrastructure using Terraform.

## Features

- Virtual Networks
- Subnets
- Network Security Groups
- Route Tables
- Public IPs

## Usage

```hcl
module "networking" {
    source = "./modules/networking"

    vnet_name           = "my-vnet"
    address_space       = ["10.0.0.0/16"]
    subnet_prefixes     = ["10.0.1.0/24"]
    subnet_names        = ["subnet1"]
    location            = "East US"
    resource_group_name = "my-resource-group"
}
```

## Inputs

| Name                | Description                       | Type     | Default     | Required |
|---------------------|-----------------------------------|----------|-------------|----------|
| vnet_name           | Name of the virtual network       | string   | n/a         | yes      |
| address_space       | Address space for the VNet        | list     | n/a         | yes      |
| subnet_prefixes     | Subnet address prefixes           | list     | n/a         | yes      |
| subnet_names        | Names of the subnets              | list     | n/a         | yes      |
| location            | Azure region                      | string   | n/a         | yes      |
| resource_group_name | Resource group name               | string   | n/a         | yes      |

## Outputs

| Name         | Description                       |
|--------------|-----------------------------------|
| vnet_id      | ID of the created virtual network |
| subnet_ids   | IDs of the created subnets        |

