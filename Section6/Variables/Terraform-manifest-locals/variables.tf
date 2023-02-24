variable "aws_region" {
  description = "Region the resources should be created"
  type        = string
  default     = "us-east-2"
}

variable "aws_s3_bucket_acl" {
  description = "Decide whether or not the s3ucket should publicly be accessible"
  type        = string
  default     = "private"
}

variable "s3bucket_forrce_destroy" {
  description = "s3bucket destruction behavior"
  type        = bool
  default     = true
}

variable "s3bucket_fix_name" {
  description = "Name to use to form the s3bucket name"
  type        = string
  default     = "macabo398"
}

variable "s3bucket_env" {
  description = "Where this s3bucket is managed"
  type        = string
  default     = "dev"
}
