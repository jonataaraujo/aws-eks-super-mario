################################################################################
# EKS Cluster Resource
################################################################################

resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = aws_iam_role.main.arn

  vpc_config {
    subnet_ids = data.aws_subnets.public.ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.main-AmazonEKSClusterPolicy,
  ]
}