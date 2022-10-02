terraform {
  backend "s3" {
    bucket = "terraria-server-tfstate"
    key    = "terraria-server/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = local.aws_region
}
