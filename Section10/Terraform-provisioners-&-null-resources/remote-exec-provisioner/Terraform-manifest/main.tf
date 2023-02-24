# Ec2 resources
resource "aws_instance" "ec2instance" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  key_name               = var.ec2_keypair
  count                  = var.ec2_instance_count
  tags = {
    Name = "${terraform.workspace}-dev-workspace-${count.index}"
  }
  connection {
    agent       = false
    type        = "ssh"
    user        = "ec2-user"
    password    = ""
    host        = self.public_ip
    private_key = file("ssh-p-key/terraform-key.pem")
  }

  provisioner "file" {
    source      = "folders/folder2/sixth.sh"
    destination = "/home/ec2-user/message.sh"
  }
  
  provisioner "remote-exec" {
    inline = [
      "sleep 120", # To allow Apache service to start handling traffics
      "chmod a+x /home/ec2-user/message.sh",
      "bash -x /home/ec2-user/message.sh"
    ]
  }
}
