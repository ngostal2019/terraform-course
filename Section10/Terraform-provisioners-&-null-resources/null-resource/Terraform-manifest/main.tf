# Ec2 resources
resource "aws_instance" "ec2instance" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  key_name               = var.ec2_keypair
  # count                  = var.ec2_instance_count
  tags = {
    Name = "${terraform.workspace}-dev-workspace"
  }
}

# Increase the creation time creation to allow downstream resource to execute after apache is up and running
resource "time_sleep" "wait_for_apache" {
  depends_on      = [aws_instance.ec2instance] # Creating dependency to the resource "aws_instance" "ec2instance" to allow appache to be ready before execution of other resources
  create_duration = "90s"
}

# Here null_resource will use the triggers to update the aws ec2 instance in place with its new changes (from the provisioners executions) without destroying the whole instance
resource "null_resource" "execute_operation" {
  depends_on = [time_sleep.wait_for_apache] # Creating dependency to the resource "time_sleep" "wait_for_apache"
  triggers = {
    "updated" = timestamp() # Always saves the time the resources were updated
  }

  connection {
    type        = "ssh"
    agent       = false
    host        = aws_instance.ec2instance.public_ip
    private_key = file("ssh-p-key/terraform-key.pem")
    user        = "ec2-user"
    password    = ""
  }

  provisioner "file" {
    source      = "folders/folder2/sixth.sh"
    destination = "/home/ec2-user/message.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "set -x",
      "chmod a+x /home/ec2-user/message.sh",
      "bash /home/ec2-user/message.sh"
    ]
  }

  provisioner "local-exec" {
    working_dir = "local-exec-creation-time"
    command     = "echo \"Resource --> ${aws_instance.ec2instance.ami} got created at ${time_sleep.wait_for_apache.id} with public IP --> ${aws_instance.ec2instance.public_ip}\" >> from-creation-time.txt"
  }
/*
# This is not applicable
  provisioner "local-exec" {
    working_dir = "local-exec-destroy-time"
    command     = "echo Resource ${aws_instance.ec2instance.ami} got destroyed with public IP ${aws_instance.ec2instance.public_ip} >> from-destruction-time.txt"
    when        = destroy
  }
  */
}
