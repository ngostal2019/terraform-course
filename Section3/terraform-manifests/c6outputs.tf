# Terraform Output Values

# Ec2 Instance Public IP
output "instance_pubic_ip" {
    description = "Ec2 Instance Public IP"
    value = aws_instance.ec2instance.public_ip
}

# Ec2 Instance Public DNS
output "instance_public_dns" {
    description = "Ec2 Instance Public DNS"
    value =   aws_instance.ec2instance.public_dns
}

# Ec2 Instance Key pair used
output "instance_keypair" {
    description = "Ec2 Instance Key Pair Used"
    value = aws_instance.ec2instance.key_name  
}