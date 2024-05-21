################################################################################
# Provider
################################################################################

variable "region" {
  description = "Region deploy resources"
  type        = string
}

################################################################################
# Cluster
################################################################################

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes `<major>.<minor>` version to use for the EKS cluster (i.e.: `1.27`)"
  type        = string
  default     = null
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

variable "desired_size" {
  description = "Desired number of worker nodes in private subnet"
  default     = 1
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes in private subnet."
  default     = 2
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes in private subnet."
  default     = 1
  type        = number
}