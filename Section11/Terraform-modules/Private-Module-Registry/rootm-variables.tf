# AWS Regions
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-2"
}

variable "s3_bucket_name" {
  description = "Unique Name Across The Entire AWS Cloud"
  type        = string
  default     = "random-s3-static-website2"
}


variable "s3_tags" {
  description = "Map of s3 bucket Tags from the child module"
  type        = map(string)
  default = {
    "ManagedBy"      = "Terraform"
    "Env"            = "Dev"
    "Owner"          = "Staline Ngoma"
    "Date"           = "02-25-2023"
    "ModuleName"     = "s3_bucket_website_child_module"
    "ModuleLocation" = "app.terraform.io/uct-demo1/s3-website/aws"
    "version"        = "1.0.1"
  }
}