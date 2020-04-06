module "sg_app" {
  source = "./modules/sg"

  vpc_id = local.vpc_id

  name = "${local.name}"
  tags = local.tags

  ingress_with_security_group_rules = [
    {
      "source_security_group_id" : local.alb_sg_id,
      "port" : "80"
    }
  ]
}
