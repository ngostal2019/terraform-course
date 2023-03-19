variable "aws_region" {
  description = "The designated AWS region"
  type        = string
  default     = "us-east-2"
}

variable "security_group" {
  description = "Object to structure the SG dynamic block"
  type = map(object({
    description = string
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = {
    "ssh" = {
      description = "Allow SSH communication"
      port        = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    "http" = {
      description = "Allow HTTP communication"
      port        = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "instance_type" {
  description = "Instance type to launch"
  type        = string
  default     = "t2.micro"
}

variable "keypair" {
  description = "Keypair to launch the ec2 with"
  type        = string
  default     = "keypair"
}