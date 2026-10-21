variable "region" {
  type    = string
  default = "us-east-1"
}

variable "account_id" {
  type    = string
  default = "657092010570"
}

variable "cluster_name" {
  description = "Must match the kubernetes.io/cluster/<name> subnet tags from the vpc layer"
  type        = string
  default     = "sre-observability"
}

variable "kubernetes_version" {
  description = "Fallback: 1.35"
  type        = string
  default     = "1.36"
}

variable "state_bucket" {
  type    = string
  default = "ovr-eks-sre-tfstate-657092010570-us-east-1"
}

variable "vpc_state_key" {
  type    = string
  default = "vpc/terraform.tfstate"
}

variable "endpoint_public_access_cidrs" {
  description = "Open on purpose: GitHub-hosted runners need the public endpoint. IAM + access entries are the gate."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "node_instance_type" {
  type    = string
  default = "t3.large"
}

variable "node_capacity_type" {
  type    = string
  default = "ON_DEMAND"
}

variable "node_min_size" {
  type    = number
  default = 2
}

variable "node_desired_size" {
  type    = number
  default = 2
}

variable "node_max_size" {
  type    = number
  default = 3
}

variable "node_disk_size_gb" {
  type    = number
  default = 50
}

variable "imds_hop_limit" {
  description = "1 blocks pods from reaching node IMDS credentials. LB Controller then needs vpcId/region set explicitly."
  type        = number
  default     = 1
}

variable "operator_user_name" {
  type    = string
  default = "OVR-Busayo"
}

variable "apply_role_name" {
  type    = string
  default = "eks-sre-github-deploy"
}

variable "plan_role_name" {
  type    = string
  default = "eks-sre-github-plan"
}

variable "addon_versions" {
  description = "Verified available for K8s 1.36"
  type        = map(string)
  default = {
    "vpc-cni"                = "v1.23.2-eksbuild.3"
    "kube-proxy"             = "v1.36.0-eksbuild.48"
    "coredns"                = "v1.14.7-eksbuild.11"
    "eks-pod-identity-agent" = "v1.4.0-eksbuild.4"
  }
}