variable "name" {
  type = "string"
}

variable "tags" {
  default = {}
}

variable "account_id" {
  type = "string"
}

variable "vpc_id" {
  type = "string"
}

variable "alb_https_listener_arn" {
  type = "string"
}

# インバウンドポート
variable "port" {
  default = "80"
}

# タスク定義
variable "container_definitions" {
  type = "string"
}

variable "task_cpu" {
  default = 256
}

# 単位 MB
variable "task_memory" {
  default = 512
}

variable "ecs_cluster_name" {
  type = "string"
}

variable "service_desired_count" {
  default = 2
}

variable "subnets" {
  type = "list"
}

variable "security_groups" {
  type = "list"
}
