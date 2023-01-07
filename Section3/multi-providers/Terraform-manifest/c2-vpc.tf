resource "aws_vpc" "tfm-vpc" {
  cidr_block = "10.0.0.0/18"
  provider = aws.us-east-2 # Alias Provider is used 
  tags = {
      Name = "tfm-vpc-us-east-2"
      Owner = "Managed By Terraform"
      Alias = "aws.us-east-2"
    }
}

resource "aws_vpc" "tfm-vpc2" {
  cidr_block = "10.0.0.0/16"
  tags = {
      Name = "tfm-vpc-us-east-1"
      Owner = "Managed By Terraform"
    }
}