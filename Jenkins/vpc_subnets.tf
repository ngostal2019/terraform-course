resource "aws_security_group" "jenkins_ingress" {
  name        = "SSH-HTTP Communication"
  description = "Allow inbound traffic to the Jenkins server"

  dynamic "ingress" {
    for_each = var.security_group
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name                = "jenkins-sg"
    LaunchedByTerraform = "True"
  }
}