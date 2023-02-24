// Provider Block
provider "aws" {
  region = var.aws_region
}

provider "null" {
}

provider "time" {
}