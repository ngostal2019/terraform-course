resource "aws_instance" "lifecycle_create_before_destroy" {
  ami               = "ami-0a606d8395a538502"
  instance_type     = "t2.micro"
  availability_zone = "us-east-2a"
# availability_zone = "us-east-2c"
  key_name          = "terraform-key"
  tags = {
    "Name"  = "Auto-tfm-ec2"
    "Owner" = "Staline Ngoma"
    "Role"  = "DevOps Engineer"
  }
  lifecycle {
    create_before_destroy = true
  }
}
