// Terraform Block
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