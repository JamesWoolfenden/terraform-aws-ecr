provider "aws" {
  region  = var.region
  version = "2.12"
}

provider "null" {
  version = "2.1"
}

provider "local" {
  version = "1.2"
}

provider "template" {
  version = "2.1"
}
