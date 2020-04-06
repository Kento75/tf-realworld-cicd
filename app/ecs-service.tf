data "template_file" "container_definitions" {
  template = "${file("container_definitions.json")}"

  vars = {
    account_id = local.account_id
    name       = local.name
    region     = "ap-northeast-1"

    image_tag = var.image_tag
  }
}

module "ecs" {
  source = "./modules/ecs-service"

  name = local.name
  tags = local.tags

  account_id             = local.account_id
  alb_https_listener_arn = local.alb_https_listener_arn
  container_definitions  = data.template_file.container_definitions.rendered
  ecs_cluster_name       = local.ecs_cluster_name
  port                   = "80"
  security_groups        = [module.sg_app.sg_id]
  subnets                = local.subnets
  vpc_id                 = local.vpc_id
}
