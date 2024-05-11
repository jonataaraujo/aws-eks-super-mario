################################################################################
# Data sources
################################################################################

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_eks_cluster" "main" {
  name = aws_eks_cluster.main.id
}

data "aws_eks_cluster_auth" "main" {
  name = aws_eks_cluster.main.id
}

data "aws_route53_zone" "main" {
  name         = var.domain
  private_zone = false
}