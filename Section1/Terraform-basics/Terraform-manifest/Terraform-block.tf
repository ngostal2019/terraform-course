terraform {
  required_version = "~> 1.3.0" #Any greater version than 1.3 will be accepted
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    # Provider block set to AWS with the region
    random = {
        source = "hashicorp/random"
        version = "~> 3.4.3"
    }
  }
}