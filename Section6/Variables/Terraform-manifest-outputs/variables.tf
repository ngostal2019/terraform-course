variable "allocated_storage" {
  description = "The allocated storage in gibibytes."
  type        = number
  default     = 50
}
variable "db_name" {
  description = "Default name used to create the instance"
  type        = string
  default     = "tfm_mariabd_server"
}

variable "availability_zone" {
  description = "AZ where to launch the instance"
  type        = string
  default     = "us-east-2a"
}

variable "db_instance_count" {
  description = "MariaDB instance count needed"
  type        = number
  default     = 1
}

variable "db_engine" {
  description = "DB engine used to create this instance"
  type        = string
  default     = "mariadb"
}

variable "engine_version" {
  description = "mariaDB engine version we intend to use "
  type        = string
  default     = "10.6"
}
variable "db_instance_class" {
  description = "The map DB instance class to choose from"
  type        = map(string)
  default = {
    "t2micro" : "db.t2.micro"
    "t3micro" : "db.t3.micro"
  }
}

variable "db_password" {
  description = "Sensitive DB password to use for connection"
  type        = string
  sensitive   = true
}

variable "db_username" {
  description = "Sensitive DB username to use for connection"
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "Region the resources should be created"
  type        = string
  default     = "us-east-2"
}

variable "multi_az" {
  description = "Decide whether or not the instance is available in other AZ simultaneously"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags used to label resources"
  type        = map(string)
  default = {
    "Name"        = "mariaDB Test"
    "Owner"       = "Staline Ngoma"
    "Role"        = "DevOps Engineer"
    "Environment" = "Dev/Test"
    "Managed By"  = "Terraform"
  }
}

variable "skip_final_snapshot" {
  description = "Boolean to set the snapshot decision"
  type        = bool
  default     = true
}

variable "publicly_accessible" {
  description = "Decide whether or not the DB instance should accessible from the internet"
  type        = bool
  default     = false
}