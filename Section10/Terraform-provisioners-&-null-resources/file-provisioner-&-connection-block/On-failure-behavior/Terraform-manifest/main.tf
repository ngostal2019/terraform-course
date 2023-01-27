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
    source      = "folders"
    destination = "/tmp/"
  }

  provisioner "file" {
    source      = "folders/folder1/"
    destination = "/tmp/"
  }

  provisioner "file" {
    source      = "folders/folder2/"
    destination = "/tmp/"
  }

  provisioner "file" {
    source      = "folders/folder1"
    destination = "/tmp/"
  }

  provisioner "file" {
    source      = "folders/folder2"
    destination = "/tmp/"
  }

  provisioner "file" {
    source      = "folders/folder2/sixth.sh"
    destination = "/home/ec2-user/"
  }

  provisioner "file" {
    content     = "The following AMI was used: ${self.ami}"
    destination = "/tmp/ami_id.txt"
  }

  provisioner "file" {
    source      = "folders/first.txt"
    destination = "/var/www/html/first.txt"
    # on_failure = continue 
    # Uncomment the above on_failure to allow terraform apply to continue even when failure shows up and will not taint the resource for destruction on next terraform apply
  }
}
