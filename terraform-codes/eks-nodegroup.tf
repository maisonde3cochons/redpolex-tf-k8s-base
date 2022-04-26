resource "aws_eks_node_group" "redpolex-eks-nodegroup" {
  cluster_name    = aws_eks_cluster.redpolex-eks-cluster.name
  node_group_name = "redpolex-eks-nodegroup"
  node_role_arn   = aws_iam_role.redpolex-iam-role-eks-nodegroup.arn
  subnet_ids      = ["subnet-0b6acd831e5af7d7b","subnet-00e7ae04531daf179"]
  instance_types = ["t3.small"]
  disk_size = 20

  labels = {
    "role" = "eks-nodegroup"
  }

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.redpolex-iam-policy-eks-nodegroup,
    aws_iam_role_policy_attachment.redpolex-iam-policy-eks-nodegroup-cni,
    aws_iam_role_policy_attachment.redpolex-iam-policy-eks-nodegroup-ecr,
  ]

  tags = {
    "Name" = "${aws_eks_cluster.redpolex-eks-cluster.name}-worker-node"
  }
}

# resource "aws_eks_node_group" "redpolex-eks-nodegroup2" {
#   cluster_name    = aws_eks_cluster.redpolex-eks-cluster.name
#   node_group_name = "redpolex-eks-nodegroup2"
#   node_role_arn   = aws_iam_role.redpolex-iam-role-eks-nodegroup.arn
#   subnet_ids      = ["subnet-0b6acd831e5af7d7b","subnet-00e7ae04531daf179"]
#   instance_types = ["t3.small"]
#   disk_size = 20

#   labels = {
#     "role" = "eks-nodegroup"
#   }

#   scaling_config {
#     desired_size = 1
#     min_size     = 1
#     max_size     = 1
#   }

#   tags = {
#     "Name" = "${aws_eks_cluster.redpolex-eks-cluster.name}-worker-node2"
#   }
# }