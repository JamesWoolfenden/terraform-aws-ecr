module "ecr" {
  source           = "../../"
  name             = var.name
  repositorypolicy = data.aws_iam_policy_document.allowlocals.json
  common_tags      = var.common_tags
  kms_key          = var.kms_key
}
