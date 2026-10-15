variable "region" {
  type    = string
  default = "us-east-1"
}

variable "account_id" {
  type    = string
  default = "657092010570"
}

variable "services" {
  description = "Application services that get an ECR repository"
  type        = list(string)
  default = [
    "adservice", "cartservice", "checkoutservice", "currencyservice",
    "emailservice", "frontend", "loadgenerator", "paymentservice",
    "productcatalogservice", "recommendationservice", "shippingservice",
    "shoppingassistantservice",
  ]
}


variable "github_sub_prefix" {
  description = "Subject claim prefix shown in repo Settings > Actions > OIDC"
  type        = string
  default     = "repo:Vivixell@105794570/eks-sre-observability@1414659457"
}