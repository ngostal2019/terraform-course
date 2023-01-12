variable "ec2_ami" {
  description = "Ec2 AMI ID to use"
  type        = string
  default     = "ami-0a606d8395a538502"
}

variable "instance_type" {
  description = "EC2 instance to use"
  type        = string
  default     = "t2.micro"
}

variable "availability_zone" {
  description = "AZ where to launch the instance"
  type        = string
  default     = "us-east-2a"
}

variable "aws_region" {
  description = "Region the resources should be created"
  type        = string
  default     = "us-east-2"
}

variable "ec2_instance_count" {
  description = "Ec2 instance count needed"
  type        = number
  default     = 1
}

variable "ec2_key_name" {
  description = "Key pair name to connect to the ec2 instance"
  type        = string
  default     = "terraform-key"
}

variable "user_data" {
  description = "User data to bootstrapp the ec2 instance"
  type        = string
  default     = <<-EOF
        #!/bin/bash
        sudo yum update -y
        sudo yum install -y httpd
        sudo systemctl enable --now httpd
        echo "<h1>Welcome To Unixcloudtrainings - App1.</h1>" | sudo tee /var/www/html/index.html
        sudo mkdir /var/www/html/app1 
        echo "<! DOCTYPE html> <html><head><title>UCT</title></head> <body style=\"background-color:rgb(250, 219, 210);\"> <h1>Welcome To Unixcloudtrainings - APP-1</h1> <p>Terraform Course</p><p>Application Version: V1</p> </body></html>" | sudo tee /var/www/html/app1/index.html
        sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html
    EOF  
}

variable "tags" {
  description = "Tags used to label resources"
  type        = map(string)
  default = {
    "Name"  = "Auto-tfm-ec2"
    "Owner" = "Staline Ngoma"
    "Role"  = "DevOps Engineer"
  }
}

variable "ssh_port" {
  description = "SSH port to connect to the Ec2 instance"
  type        = number
  default     = 22
}

variable "http_port" {
  description = "HTTP port to connect to the Ec2 instance"
  type        = number
  default     = 80
}

variable "cidr_block4" {
  description = "CIDR block version 4"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "cidr_block6" {
  description = "CIDR block version 6"
  type        = list(string)
  default     = ["::/0"]
}