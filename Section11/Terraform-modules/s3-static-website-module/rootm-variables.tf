# AWS Regions
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-2"
}

variable "s3_bucket_name" {
  description = "Unique Name Across The Enire AWS Cloud"
  type        = string
  default     = "random-s3-static-website2"
}


variable "s3_tags" {
  description = "Map of s3 bucket Tags from the child module"
  type        = map(string)
  default = {
    "ManagedBy"       = "Terraform"
    "Env"             = "Dev"
    "Owner"           = "Staline Ngoma"
    "Date"            = "02-04-2023"
    "ChildModuleName" = "aws-s3-static-website-bucket"
    "RootModuleName"  = "s3-static-website-module"
  }
}