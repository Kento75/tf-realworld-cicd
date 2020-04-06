provider "aws" {
  version = "~> 2.20"
  region  = "ap-northeast-1"
}

terraform {
  required_version = ">=0.12"

  backend "s3" {
    key    = "infra.tfstate"
    region = "ap-northeast-1"
  }
}
