# Ec2 resources
resource "aws_instance" "ec2instance" {
    ami = data.aws_ami.amzlinux2.id
    instance_type = var.instance_type
    user_data = file("${path.module}/app1-install.sh")
    vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
    key_name = var.ec2_keypair
    tags = {
        Name = "Terraform-Ec2"
    }
}
  