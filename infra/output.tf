output "vpc_id" {
  description = "vpc id"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "for private subnets"
  value       = module.vpc.private_subnets
}

output "alb_sg_id" {
  description = "alb sg id"
  value       = module.sg_alb.sg_id
}

output "alb_https_listener_arn" {
  description = "alb arn"
  value       = module.alb.https_listener_arn
}

output "ecs_cluster_name" {
  description = "ecs cluster name"
  value       = aws_ecs_cluster.this.name
}
