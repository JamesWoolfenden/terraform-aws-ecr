resource "aws_ecr_repository" "repository" {
  name = var.name
  tags = var.common_tags
}
