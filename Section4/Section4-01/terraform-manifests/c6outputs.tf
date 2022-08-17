# Terraform Output Values

# Output - For loop List
output "for_output_list" {
  description = "For Loop List"
  value = [for instance in aws_instance.ec2instance: instance.public_dns]
}

# Output For Loop Map
output "for_output_map" {
  description = "For Loop Map"
  value = {for instance in aws_instance.ec2instance: instance.id => instance.public_dns}
}

# Output - For Loop Map advanced
output "for_output_map2" {
  description = "For Loop Map advanced"
  value = {for c, instance in aws_instance.ec2instance: c => instance.public_dns}
}

# Output - Legacy Splat Operator - Return The List
output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Operator"
  value = aws_instance.ec2instance.*.public_dns
}

# Output - Latest Generalized Splat Operator - Return The List
output "latest_splat_instance_publicdns" {
  description = "Latest Generalized Splat Operator"
  value = aws_instance.ec2instance[*].public_dns
}

# Output - Latest Generalized Splat Operator - Return The List of keypairs used
output "latest_splat_instance_keypair" {
  description = "Latest Generalized Splat Operator keypair"
  value = aws_instance.ec2instance[*].key_name
}
