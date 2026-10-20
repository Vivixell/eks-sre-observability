terraform {
  backend "s3" {
    bucket       = "ovr-eks-sre-tfstate-657092010570-us-east-1"
    key          = "vpc/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}