variable "name" {
  type        = string
  description = "The name of the registry"
}

variable "repositorypolicy" {
  type        = string
  description = "Pass this variable a Json Policy"
}

variable "common_tags" {
  type        = map(any)
  description = "Implements the common tags scheme"
}

variable "image_tag_mutability" {
  description = "For sone strange reason this is optional behaviour."
  type        = string
  default     = "IMMUTABLE"
}

variable "scan_on_push" {
  description = "Security Scan your new container before you add it to the registry"
  type        = bool
  default     = true
}
