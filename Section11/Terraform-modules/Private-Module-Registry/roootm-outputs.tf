output "arn" {
  description = "ARN of the s3 Bucket from the child module"
  value       = module.s3_bucket_website_child_module.bucket_arn
}

output "name" {
  description = "ID / Name of the s3 Bucket from the child module"
  value       = module.s3_bucket_website_child_module.bucket_id
}

output "domain" {
  description = "Domain of the s3 Bucket from the child module"
  value       = module.s3_bucket_website_child_module.bucket_domain
}

output "endpoint" {
  description = "Endpoint of the s3 Bucket from the child module"
  value       = module.s3_bucket_website_child_module.bucket_endpoint
}