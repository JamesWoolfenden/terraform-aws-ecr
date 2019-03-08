output "ecr_host" {
  description = "The host where the registry/containers are"
  value       = "${aws_ecr_repository.repository.registry_id}.dkr.ecr.${var.region}.amazonaws.com"
}

output "ecr_repo_name" {
  description = "The name of the repository"
  value       = "${aws_ecr_repository.repository.name}"
}

output "ecr_arn" {
  description = "The Amazon resource name for the repository"
  value       = "${aws_ecr_repository.repository.arn}"
}

output "ecr_repository_url" {
  description = "The URL of your new registry"
  value       = "${aws_ecr_repository.repository.repository_url}"
}
