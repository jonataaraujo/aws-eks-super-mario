################################################################################
# Outputs
################################################################################

output "region" {
  description = "Region deploy resources"
  value       = var.region
}

output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.main.name
}

output "cluster_version" {
  description = "The Kubernetes version for the cluster"
  value       = aws_eks_cluster.main.version
}

output "load_balancer" {
  description = "URL Load Balancer"
  value       = "http://${kubernetes_service.main.status[0].load_balancer[0].ingress[0].hostname}"
}