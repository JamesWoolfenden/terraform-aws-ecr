output "ecr_host" {
  value = "${aws_ecr_repository.repository.registry_id}.dkr.ecr.${var.region}.amazonaws.com"
}

output "ecr_repo_name" {
  value = "${aws_ecr_repository.repository.name}"
}

output "ecr_arn" {
  value = "${aws_ecr_repository.repository.arn}"
}

output "ecr_repository_url" {
  value = "${aws_ecr_repository.repository.repository_url}"
}
