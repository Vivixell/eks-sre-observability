locals {
  addons_before_nodes = ["vpc-cni", "kube-proxy"]
  addons_after_nodes  = ["coredns", "eks-pod-identity-agent"]
}

# DaemonSets: become ACTIVE with zero nodes, and nodes need them to turn Ready.
resource "aws_eks_addon" "before_nodes" {
  for_each = toset(local.addons_before_nodes)

  cluster_name                = aws_eks_cluster.main.name
  addon_name                  = each.value
  addon_version               = var.addon_versions[each.value]
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "PRESERVE"
}

# CoreDNS is a Deployment and needs nodes to schedule onto.
resource "aws_eks_addon" "after_nodes" {
  for_each = toset(local.addons_after_nodes)

  cluster_name                = aws_eks_cluster.main.name
  addon_name                  = each.value
  addon_version               = var.addon_versions[each.value]
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "PRESERVE"

  depends_on = [aws_eks_node_group.main]
}