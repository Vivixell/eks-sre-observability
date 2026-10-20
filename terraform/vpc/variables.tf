variable "region" {
  type    = string
  default = "us-east-1"
}

variable "account_id" {
  type    = string
  default = "657092010570"
}

variable "cluster_name" {
  description = "EKS cluster name, used in subnet discovery tags"
  type        = string
  default     = "sre-observability"
}

variable "vpc_cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnets by AZ. ALB only, no nodes."
  type        = map(string)
  default = {
    "us-east-1a" = "10.20.0.0/24"
    "us-east-1b" = "10.20.1.0/24"
  }
}

variable "private_subnet_cidrs" {
  description = "Private subnets by AZ. Nodes and pods."
  type        = map(string)
  default = {
    "us-east-1a" = "10.20.10.0/24"
    "us-east-1b" = "10.20.11.0/24"
  }
}