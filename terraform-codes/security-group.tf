resource "aws_security_group" "redpolex-sg-eks-cluster" {
  name        = "redpolex-sg-eks-cluster"
  description = "security_group for redpolex-eks-cluster"
  vpc_id      = "vpc-0fa5d3a46b84fc427"

  tags = {
    Name = "redpolex-sg-eks-cluster"
  }
}

resource "aws_security_group_rule" "redpolex-sg-eks-cluster-ingress" {

  security_group_id = aws_security_group.redpolex-sg-eks-cluster.id
  type              = "ingress"
  description       = "ingress security_group_rule for redpolex-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "redpolex-sg-eks-cluster-egress" {

  security_group_id = aws_security_group.redpolex-sg-eks-cluster.id
  type              = "egress"
  description       = "egress security_group_rule for redpolex-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}