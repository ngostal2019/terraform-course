# AWS Regions
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-2"
}

variable "bucket_name" {
  description = "Unique Name Across The Enire AWS Cloud"
  type        = string
}


variable "tags" {
  description = "Map of s3 bucket Tags"
  type        = map(string)
  default     = {}
}