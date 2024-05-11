################################################################################
# Provider
################################################################################

variable "region" {
  description = "Region deploy resources"
  type        = string
}

################################################################################
# Route 53
################################################################################

variable "domain" {
  description = "domain deploy resources"
  type        = string
}

variable "dns" {
  description = "dns deploy resources"
  type        = string
}

################################################################################
# Cluster
################################################################################

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

################################################################################
# Node Group
################################################################################

variable "node_group_name" {
  description = "Name of the EKS Node Group"
  type        = string
}

variable "instance_types" {
  type        = list(string)
  default     = ["t2.medium"]
  description = "Set of instance types associated with the EKS Node Group."
}

variable "pvt_desired_size" {
  description = "Desired number of worker nodes in private subnet"
  default     = 1
  type        = number
}

variable "pvt_max_size" {
  description = "Maximum number of worker nodes in private subnet."
  default     = 2
  type        = number
}

variable "pvt_min_size" {
  description = "Minimum number of worker nodes in private subnet."
  default     = 1
  type        = number
}