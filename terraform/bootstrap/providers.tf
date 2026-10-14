provider "aws" {
  region              = var.region
  allowed_account_ids = [var.account_id]

  default_tags {
    tags = {
      Project   = "eks-sre-observability"
      Layer     = "bootstrap"
      ManagedBy = "terraform"
    }
  }
}