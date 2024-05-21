################################################################################
# Variables
################################################################################

# Global
region = "us-east-2"

# Cluster
cluster_name    = "eks-super-mario"
cluster_version = "1.29"

# Node Group
node_group_name = "eks-node-group"
instance_types  = ["t2.medium"]
desired_size    = 1
max_size        = 1
min_size        = 1