module "ecr" {
  source           = "github.com/JamesWoolfenden/terraform-aws-ecr"
  version          = "0.0.4"
  name             = "${var.name}"
  region           = "${var.region}"
  repositorypolicy = "${data.aws_iam_policy_document.allowlocals.json}"
}
