# Below are a few commands to interact with Terraform Workspace

[Terraform Workspace](https://developer.hashicorp.com/terraform/language/state/workspaces)

```hcl
1. Shows the current selected workspace
  terraform workspace show

2. Lists all available workspaces
  terraform workspace list

3. Creates a new workspace
  terraform workspace new <workspace_name>

4. Selects a specific workspace to become the default one
  terraform worspace select <workspace_name>

5. Deletes an unwanted workspace
  terraform workspace delete <workspace_name>
```

## Note: Working with s3 Bucket remote backend and terraform workspace

When using workspace over an s3 bucket, it will create a new environment namespace for every workspace with the same key pattern.

- e.g: env:/dev01-us/Workspace/terraform.tfstate

```hcl
terraform {
  required_version = ">= 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-state-dev6"
    key            = "Workspace/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-state-locking-table-dev"
  }
}
```
