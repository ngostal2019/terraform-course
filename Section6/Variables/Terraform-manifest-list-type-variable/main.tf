resource "aws_instance" "tfm_ec2_variable" {
  ami                    = var.ec2_ami
  instance_type          = var.instance_type[3] # This will pick the 4 element of the list to provide a string
  availability_zone      = var.availability_zone[3] # This will pick the 4 element of the list to provide a string
  key_name               = var.ec2_key_name
  vpc_security_group_ids = [aws_security_group.tfm_sg.id]
  count                  = var.ec2_instance_count
  user_data              = var.user_data
  tags                   = var.tags
}
