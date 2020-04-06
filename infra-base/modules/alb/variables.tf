variable "name" {
  type = "string"
}

variable "tags" {
  default = {}
}

variable "acm_arn" {
  type = "string"
}

variable "subnets" {
  type = "list"
}

variable "security_groups" {
  type = "list"
}
