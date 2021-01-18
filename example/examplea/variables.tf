variable "name" {
  type        = string
  description = "The name of the registry"
}

variable "common_tags" {
  type        = map(any)
  description = "Implements the common tags scheme"
}
