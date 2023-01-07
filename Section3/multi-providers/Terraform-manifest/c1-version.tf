terraform {
  required_version = "~> 1.3.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "default"
}

provider "aws" {
  region = "us-east-2"
  alias = "us-east-2"
}