resource "aws_ecr_lifecycle_policy" "cleanup" {
  repository = "${aws_ecr_repository.repository.name}"
  policy     = "${file("${path.module}/rotation_rules.json")}"
}
