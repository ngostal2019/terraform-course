output "bucket_arn" {
  description = "ARN of the s3 Bucket"
  value       = aws_s3_bucket.bucket_specs.arn
}

output "bucket_id" {
  description = "ID of the s3 Bucket"
  value       = aws_s3_bucket.bucket_specs.id
}

output "bucket_domain" {
  description = "Domain of the s3 Bucket"
  value       = aws_s3_bucket.bucket_specs.website_domain
}

output "bucket_endpoint" {
  description = "Endpoint of the s3 Bucket"
  value       = aws_s3_bucket.bucket_specs.website_endpoint
}