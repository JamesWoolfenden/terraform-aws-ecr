module "ecr" {
  source           = "../../"
  name             = "${var.name}"
  region           = "${var.region}"
  repositorypolicy = "${data.aws_iam_policy_document.allowlocals.json}"
  common_tags      = "${var.common_tags}"
}
