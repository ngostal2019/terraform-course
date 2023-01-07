# Fundamental Terraform block with version and the providers
terraform {
  required_version = ">=1.3" #Any greater version than 1.3 will be accepted
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

# Provider block set to AWS with the region
provider "aws" {
  region = "us-east-2"

}

# Resource to create on AWS
resource "aws_instance" "myfirst_ec2" {
  ami           = "ami-0a606d8395a538502" # Static value of the ami.
  instance_type = "t2.micro"
  key_name      = "terraform-key"
  tags = {
    "Name"  = "terraform-server"
    "Owner" = "Staline Ngoma"
    "Role"  = "DevOps Engineer"
  }
}