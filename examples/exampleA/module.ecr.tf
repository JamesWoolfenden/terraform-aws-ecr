module "ecr" {
  source  = "../../"
  version = "0.0.2"

  name             = "${var.name}"
  region           = "${var.region}"
  repositorypolicy = "${data.aws_iam_policy_document.allowlocals.json}"
}
