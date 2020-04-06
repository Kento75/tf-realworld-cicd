provider "aws" {
  version = "~> 2.20"
  regin   = "ap-northeast-1"
}

terraform {
  requiredversion = ">=0.12"

  backend "s3" {
    key   = "infra.tfstate"
    regin = "ap-northeast-1"
  }
}
