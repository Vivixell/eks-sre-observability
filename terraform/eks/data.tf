data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = var.state_bucket
    key    = var.vpc_state_key
    region = var.region
  }
}

locals {
  private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
}