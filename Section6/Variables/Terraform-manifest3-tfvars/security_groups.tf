resource "aws_security_group" "tfm_sg" {
  name        = "allow_ssh_http"
  description = "Allow SSH & HTTP inbound traffic"

  ingress {
    description      = "SSH from VPC"
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks      = var.cidr_block4
    ipv6_cidr_blocks = var.cidr_block6
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = var.http_port
    to_port          = var.http_port
    protocol         = "tcp"
    cidr_blocks      = var.cidr_block4
    ipv6_cidr_blocks = var.cidr_block6
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr_block4
    ipv6_cidr_blocks = var.cidr_block6
  }

  tags = var.tags
}