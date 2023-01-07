resource "aws_vpc" "tfm-vpc" {
  cidr_block = "10.0.0.0/18"
  tags = {
      Name = "tfm-vpc"
      Owner = "Managed By Terraform"
    }
}