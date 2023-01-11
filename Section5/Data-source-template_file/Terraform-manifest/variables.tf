variable "region" {
  description = "The default AWS region to create the resource"
  type        = string
  default     = "us-east-2"
}

variable "image_id" {
  description = "The default AMI id to use for the EC2 instance"
  type        = string
  default     = "ami-0a606d8395a538502"
}

variable "tags" {
  description = "Default map of tags to attach to resource"
  type        = map(string)
  default = {
    "Name"  = "Auto-tfm-ec2"
    "Owner" = "Staline Ngoma"
    "Role"  = "DevOps Engineer"
  }
}

variable "instance_type" {
  description = ""
  type        = string
  default     = "t2.micro"
}