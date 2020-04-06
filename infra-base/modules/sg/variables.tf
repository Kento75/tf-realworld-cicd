variable "name" {
  type = "string"
}

variable "description" {
  default = ""
}

variable "tags" {
  default = {}
}

variable "vpc_id" {
  type = "string"
}

variable "ingress" {
  default = []
}

variable "ingress_with_security_group_rules" {
  default = []
}
