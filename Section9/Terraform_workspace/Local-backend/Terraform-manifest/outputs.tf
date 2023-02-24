# Terraform Output Values

# Output - Latest Generalized Splat Operator - Return The List
output "latest_splat_instance_publicdns" {
  description = "Latest Generalized Splat Operator For Public dns"
  value       = aws_instance.ec2instance[*].public_dns
}

# Output - Latest Generalized Splat Operator - Return The List of keypairs used
output "latest_splat_instance_public_ip" {
  description = "Latest Generalized Splat Operator public IP"
  value       = aws_instance.ec2instance[*].public_ip
}
