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

  provisioner "local-exec" {
    working_dir = "local-exec-creation-time/"
    command     = "echo \"Instance ${self.ami} was created\" >> from-local-execution.txt" # Will automatically get executed during terraform apply
  }

  provisioner "local-exec" {
     working_dir = "local-exec-destroy-time" # This will be used to create the file passed in the command line
     command = "echo \"Instance --> ${self.ami} was destroyed with IP --> ${self.public_ip} and with DNS --> ${self.public_dns}\" >> from-local-destruction.txt"
     when    = destroy  # Will automatically get executed during terraform destroy
  }
}
