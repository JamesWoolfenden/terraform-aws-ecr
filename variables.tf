variable "name" {
  type        = string
  description = "The name of the registry"
}

variable "repositorypolicy" {
  type        = string
  description = "Pass this variable a Json Policy"
}

variable "common_tags" {
  type        = map
  description = "Implements the common tags scheme"
}

variable "image_tag_mutability" {
  type    = string
  default = "IMMUTABLE"
}

variable "scan_on_push" {
  type    = bool
  default = true
}
