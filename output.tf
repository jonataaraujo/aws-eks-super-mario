################################################################################
# Outputs
################################################################################

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = var.cluster_name
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "url" {
  value = "http://${aws_route53_record.main.name}"
}
