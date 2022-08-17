# Input Variables
# AWS Regions
variable "aws_region" {
    description = "Region in which AWS resources to be created"
    type = string
    default = "us-east-2" 
}


# AWS Ec2 Instance Type
variable "instance_type" {
    description = "Ec2 Instance Type"
    type = string
    default = "t3.micro"
}


# AWS Ec2 Instance Key pair
variable "ec2_keypair" {
  description = "Ec2 Key Pair"
  type = string
  default = "keypair"
}

# AWS Ec2 Instance Type List
variable "instance_type_list" {
  description = "Ec2 Instance Type List"
  type = list(string)
  default = [ "t3.micro", "t3.small", "t3.large" ]
}

# AWS Ec2 Instance Type Map
variable "instance_type_map" {
  description = "Ec2 Instance Type Map"
  type = map(string)
  default = {
    "dev" = "t3.micro"
    "qa" = "t3.small"
    "prod" = "t3.large"
  }
}