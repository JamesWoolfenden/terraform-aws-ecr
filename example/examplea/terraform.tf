terraform {
  required_providers {
    aws = {
      version = "3.32.0"
      source  = "hashicorp/aws"
    }
    random = {
      version = "3.0.1"
      source  = "hashicorp/random"
    }
  }
  required_version = "0.14.8"
}
