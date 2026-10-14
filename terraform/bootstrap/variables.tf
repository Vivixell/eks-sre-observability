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

variable "github_repo" {
  description = "GitHub repository allowed to assume the deploy role (owner/name)"
  type        = string
  default     = "Vivixell/eks-sre-observability"
}