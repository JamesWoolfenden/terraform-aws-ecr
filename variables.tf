variable "region" {
  type        = "string"
  description = "The region to create your registry in."
}

variable "name" {
  type        = "string"
  description = "The name of the registry"
}

variable "repositorypolicy" {
  type        = "string"
  description = "Pass this variable a Json Policy"
}

# this is enables you to add dependancies
variable depends_on {
  default     = []
  description = "This is a way to make a module depends on, which isnt built in."
  type        = "list"
}

variable "common_tags" {
  type        = "map"
  description = "Implements the common tags scheme"
}
