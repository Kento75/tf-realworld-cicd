resource "aws_ecs_cluster" "this" {
  name = local.name
  tags = local.tags

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
