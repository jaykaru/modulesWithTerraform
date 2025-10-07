# Terraform Modules Documentation

This project demonstrates the use of Terraform modules to organize and manage infrastructure as code. The repository is structured to promote reusability, scalability, and maintainability.

## Structure

- **modules/**: Contains reusable Terraform modules for different resources.
- **main.tf**: Example usage of modules to provision infrastructure.
- **variables.tf**: Defines input variables for customization.
- **outputs.tf**: Exposes useful outputs from the modules.

## How It Works

1. **Define Modules**: Each module encapsulates the configuration for a specific resource (e.g., network, compute).
2. **Reference Modules**: In your root configuration, use the `module` block to call and configure each module.
3. **Customize with Variables**: Pass variables to modules for environment-specific settings.
4. **Provision Infrastructure**: Run `terraform init`, `terraform plan`, and `terraform apply` to deploy resources.

## Example

```hcl
module "network" {
    source = "./modules/network"
    cidr_block = var.network_cidr
}

module "compute" {
    source = "./modules/compute"
    instance_count = var.instance_count
}
```

## Benefits

- **Reusability**: Modules can be reused across projects.
- **Maintainability**: Changes are isolated to modules, reducing risk.
- **Scalability**: Easily add or modify resources by updating modules.

## Getting Started

1. Clone the repository.
2. Review and customize variables in `variables.tf`.
3. Initialize Terraform:  
     ```sh
     terraform init
     ```
4. Plan and apply changes:  
     ```sh
     terraform plan
     terraform apply
     ```

---

# Terraform Project Structure Explained

This document explains the recommended structure for a Terraform project, including:
- Root and child modules
- Why both have `variables.tf`
- How variable flow works
- A real-world analogy
- Example code snippets
- Multi-environment setup

---

## 📂 Recommended Project Structure
root/
├── backend.tf
├── provider.tf
├── main.tf
├── variables.tf
├── terraform.tfvars        # dev environment
├── prod.tfvars             # prod environment
└── modules/
├── ec2_instance/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── s3_bucket/
├── main.tf
└── variables.tf

---

## ✅ Why Both Root and Child Have `variables.tf`

- **Root `variables.tf`**: Defines inputs for the root module (entry point). These values come from `terraform.tfvars` or CLI.
- **Child `variables.tf`**: Defines inputs for the child module so Terraform knows what arguments the module expects.

Think of it like **function parameters**:
- Root = main program
- Child = function
- Root variables = arguments
- Child variables = function parameters

---

---

## 🧠 Real-World Analogy

Imagine writing a Python program:

If the function doesn’t declare instance_type, Python throws an error. Same with Terraform — child modules must declare their own variables.

```python
# Root program
def main():
    instance_type = "t3.micro"  # root variable
    create_ec2(instance_type)   # pass to function

# Child function
def create_ec2(instance_type):  # function parameter
    print(f"Creating EC2 of type {instance_type}")


```