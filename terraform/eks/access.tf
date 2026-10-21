locals {
  access_entries = {
    operator = {
      principal_arn = "arn:aws:iam::${var.account_id}:user/${var.operator_user_name}"
      policy        = "AmazonEKSClusterAdminPolicy"
    }
    apply = {
      principal_arn = "arn:aws:iam::${var.account_id}:role/${var.apply_role_name}"
      policy        = "AmazonEKSClusterAdminPolicy"
    }
    plan = {
      principal_arn = "arn:aws:iam::${var.account_id}:role/${var.plan_role_name}"
      policy        = "AmazonEKSViewPolicy"
    }
  }
}

resource "aws_eks_access_entry" "this" {
  for_each = local.access_entries

  cluster_name  = aws_eks_cluster.main.name
  principal_arn = each.value.principal_arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "this" {
  for_each = local.access_entries

  cluster_name  = aws_eks_cluster.main.name
  principal_arn = aws_eks_access_entry.this[each.key].principal_arn
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/${each.value.policy}"

  access_scope {
    type = "cluster"
  }
}