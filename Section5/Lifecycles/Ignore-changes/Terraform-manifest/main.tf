resource "aws_instance" "lifecycle_ignore_changes" {
  ami = "ami-0a606d8395a538502"
  instance_type     = "t2.micro"
#   instance_type     = "t3.large"
  availability_zone = "us-east-2a"
  key_name          = "terraform-key"
  tags = {
    "Name"  = "Auto-tfm-ec2"
    "Owner" = "Staline Ngoma"
    "Role"  = "DevOps Engineer"
    # "Managed by" = "Terraform"
  }
  lifecycle {
    ignore_changes = [tags, instance_type, ] # Will prevent changes make on those resources OR we can even give "all" instead
  }
}
