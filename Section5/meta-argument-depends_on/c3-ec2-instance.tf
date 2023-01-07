resource "aws_instance" "tfm_blue_ec2" {
  ami                    = "ami-0a606d8395a538502"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.tfm_subnet.id
  vpc_security_group_ids = [aws_security_group.tfm_sgp.id]
  key_name               = "terraform-key"
  user_data              = file("app1-install.sh")
  tags = {
    "Name" = "Auto-tfm-ec2"
    "Owner" = "Staline Ngoma"
    "Role"  = "DevOps Engineer"
  }
}