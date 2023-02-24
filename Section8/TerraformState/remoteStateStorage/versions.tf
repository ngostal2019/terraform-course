terraform {
  required_version = ">=1.3"
  required_providers {
    aws = {
      version = ">=4.0"
      source  = "hashicorp/aws"
    }
  } #  Remote backend
  backend "s3" {
    bucket         = "terraform-state-dev6" # Bucket name
    key            = "dev/terraform.state"  # Folder inside the bucket name/file to create or update
    region         = "us-east-2"
    dynamodb_table = "terraform-state-locking-table-dev" # Referencing DynamoDB table for state locking
  }
}
