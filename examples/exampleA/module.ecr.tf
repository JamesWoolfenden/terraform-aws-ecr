module "ecr" {
  source  = "../../"
  version = "0.0.2"

  name   = "${var.name}"
  region = "${var.region}"
}
