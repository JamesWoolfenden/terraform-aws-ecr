module "ecr" {
  source  = "../../"
  name   = "${var.name}"
  region = "${var.region}"
}
