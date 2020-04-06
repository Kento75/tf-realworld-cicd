terraform {
  required_version = ">=0.12"
  backend "s3" {
    key    = "app.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  version = "~> 2.20"
  region  = "ap-northeast-1"
}

data "aws_caller_identity" "self" {}

data "terraform_remote_state" "inf" {
  backend = "s3"

  workspace = terraform.workspace

  config = {
    key    = "infra.tfstate"
    region = "ap-northeast-1"
    bucket = local.workspace["remote_bucket"]
  }
}

locals {
  account_id = data.aws_caller_identity.self.account_id
  vpc_id     = data.terraform_remote_state.inf.outputs.vpc_id

  # ECSの登録先Subnet
  subnets = data.terraform_remote_state.inf.outputs.private_subnets

  # ECS ServiceにアタッチするALB Listener
  alb_https_listener_arn = data.terraform_remote_state.inf.outputs.alb_https_listener_arn

  # ECS Service の配置先 クラスタ名
  ecs_cluster_name = data.terraform_remote_state.inf.outputs.ecs_cluster_name

  # ECS Service にアタッチする ALB
  alb_sg_id = data.terraform_remote_state.inf.outputs.alb_sg_id
}
