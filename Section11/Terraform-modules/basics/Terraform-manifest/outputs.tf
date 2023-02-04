# Module outtputs
output "ec2_instance_public_ip" {
  description = "Ec2 Instances Public IP"
  value       = [ for pbip in module.ec2_instance: pbip.public_ip ]
}

output "ec2_instance_public_dns" {
  description = "Ec2 Instances Public DNS"
  value       = [ for pdns in module.ec2_instance: pdns.public_dns ]
}

output "ec2_instance_private_ip" {
  description = "Ec2 Instances Private IP"
  value       = [ for pvip in module.ec2_instance : pvip.private_ip ]
}

output "ec2_instance_arn" {
  description = "Ec2 Instances ARN"
  value       = [ for arname in module.ec2_instance: arname.arn ]
}