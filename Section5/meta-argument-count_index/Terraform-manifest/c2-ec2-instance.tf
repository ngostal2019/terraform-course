resource "aws_instance" "blue-ec2" {
  count             = 3
  ami               = "ami-0b5eea76982371e91"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1c"
  tags = {
    "Name"  = "ec2-test-${count.index}"
    "Owner" = "Staline Ngoma"
    "Role"  = "DevOps Engineer"
  }
}