resource "aws_eks_cluster" "redpolex-eks-cluster" {

  depends_on = [
    aws_iam_role_policy_attachment.redpolex-iam-policy-eks-cluster,
    aws_iam_role_policy_attachment.redpolex-iam-policy-eks-cluster-vpc,
  ]

  name     = var.cluster-name
  role_arn = aws_iam_role.redpolex-iam-role-eks-cluster.arn
  version = "1.21"

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  vpc_config {
    security_group_ids = [aws_security_group.redpolex-sg-eks-cluster.id]
    subnet_ids         = ["subnet-0b6acd831e5af7d7b","subnet-00e7ae04531daf179"]
    endpoint_public_access = true
  }


}