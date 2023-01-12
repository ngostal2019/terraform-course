resource "aws_instance" "lifecycle_prevent_destroy" {
  ami               = "ami-0a606d8395a538502"
  instance_type     = "t2.micro"
  availability_zone = "us-east-2a"
  key_name          = "terraform-key"
  tags = {
    "Name"       = "Auto-tfm-ec2"
    "Owner"      = "Staline Ngoma"
    "Role"       = "DevOps Engineer"
    "Managed by" = "Terraform"
  }
  # lifecycle {
  #   prevent_destroy = true # Will prevent the destruction of the resources
  # }
}