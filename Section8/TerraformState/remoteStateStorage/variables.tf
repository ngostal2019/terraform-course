# Input Variables
# AWS Regions
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-2"
}

# AWS Ec2 Instance Type
variable "instance_type" {
  description = "Ec2 Instance Type"
  type        = string
  default     = "t2.micro"
  # default     = "t3.micro" # Testing bucket versioning
}

# AWS Ec2 Instance Key pair
variable "ec2_keypair" {
  description = "Ec2 Key Pair"
  type        = string
  default     = "terraform-key"
}