################################################################################
# AWS Provider
################################################################################

provider "aws" {
  region = var.region
}

################################################################################
# K8S Provider
################################################################################

provider "kubernetes" {
  host                   = data.aws_eks_cluster.main.endpoint
  token                  = data.aws_eks_cluster_auth.main.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.main.certificate_authority.0.data)
}