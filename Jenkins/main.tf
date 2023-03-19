resource "aws_instance" "jenkins_local_name" {
  ami                    = data.aws_ami.amz-ami-jenkins.id
  instance_type          = var.instance_type
  key_name               = var.keypair
  vpc_security_group_ids = [aws_security_group.jenkins_ingress.id]
  user_data              = file("${path.module}/jenkins_install.sh")
  tags = {
    "Name" = "Jenkins-server"
  }
}