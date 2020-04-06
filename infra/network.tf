locals {
  domains = split(",", local.workspace["domains"])
}

module "vpc" {
  source "./modules/vpc"
  name = local.name
  tags = local.tags
}

module "sg_alb" {
  source = "./modules/sg"
  name = "${local.name}-alb"
  vpc_id = module.vpc.vpc_id
  tags = local.tags
  ingress = [
    {
      "cidr_blocks" : "0.0.0.0/0",
      "port" : "80"
    },
    {
      "cidr_blocks" : "0.0.0.0/0",
      "port" : "443"
    }
  ]
}

module "acm" {
  source = "./modules/acm"

  name = local.name
  tags = local.tags

  domains = split(",", local.workspace["domains"])
}

module "alb" {
  source = "./modules/alb"

  name = local.name
  tags = local.tags

  subnets         = module.vpc.public_subnets
  security_groups = [module.sg_alb.sg_id]
  acm_arn         = module.acm.acm_arn
}

data "aws_route53_zone" "this" {
  name         = local.domains[0]
  private_zone = false
}

resource "aws_route53_record" "this" {
  count = length(local.domains)

  name    = local.domains[count.index]
  zone_id = data.aws_route53_zone.this.id

  type = "A"

  alias {
    name                   = module.alb.alb_dns_name
    zone_id                = module.alb.alb_zone_id
    evaluate_target_health = true
  }
}