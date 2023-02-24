# Outputs are useful to get information that are normally only available (or at the terraform destroy phase) from the cloud provider directly from your terminal
output "endpoint" {
  description = "Corresponding value of the DB enpoint"
  value       = aws_db_instance.tfm-mariadb.endpoint
}

output "engine_version_actual" {
  description = "The fully running version of the database."
  value       = aws_db_instance.tfm-mariadb.engine_version_actual
}

output "mariadb_id" {
  description = "The RDS running instance id."
  value       = aws_db_instance.tfm-mariadb.id
}

output "port" {
  description = "Port used to connect to the instance"
  value       = aws_db_instance.tfm-mariadb.port
}

output "status" {
  description = "The status of the DB instance"
  value       = aws_db_instance.tfm-mariadb.status
}

output "mariadb_arn" {
  description = "AWS DB arn"
  value       = aws_db_instance.tfm-mariadb.arn
}

/* 
## Terraform statefile query using output

# When "terraform apply" produces the terraform.tfstate file, we can do the following

terraform output -json
terraform output # This list all the output
terraform output engine_version_actual # This will output the value of engine_version_actual

*/