resource "aws_ecr_repository" "repository" {
  name                 = var.name
  image_tag_mutability = "IMMUTABLE"

  encryption_configuration {
    encryption_type = var.encryption_type
    kms_key         = var.kms_key
  }

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.common_tags
}


variable "encryption_type" {
  type    = string
  default = "KMS"
}

variable "kms_key" {
  type = string
}
