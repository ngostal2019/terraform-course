/*Terraform (Settings/Configurations) Block
Terraform block used to configure some high-level behaviors of Terraform
*/
terraform {
  required_version = "~> 1.2"
  required_providers {
    aws = {
        source    = "hashicorp/aws"
        /*version = "~>4.26" but recommended in production */
    }
  }
}

/*Provider Block*/
provider "aws" {
    profile = "default" /*AWS credentials Profile configure on your local desktop terminal*/
    region  = "us-east-2"  
}

/*Resource Block*/
resource "aws_instance" "ec2demo" {
    ami           = "ami-051dfed8f67f095f5" /*Amazon Linux 2 AMI ID in us-east-2*/
    instance_type = "t2.micro"
  
}