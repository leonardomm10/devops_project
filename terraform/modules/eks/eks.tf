module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.5"

  cluster_name    = "${var.aws_project_name}-eks"
  cluster_version = var.aws_eks_version

  enable_cluster_creator_admin_permissions = true

  subnet_ids = var.aws_vpc_private_subnets
  vpc_id     = var.aws_vpc_id

  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent    = true
      before_compute = true
      configuration_values = jsonencode({
        env = {
          ENABLE_PREFIX_DELEGATION = "true"
          WARM_PREFIX_TARGET       = "1"
        }
      })
    }
    aws-ebs-csi-driver = {
      most_recent = true
    }
    aws-efs-csi-driver = {
      most_recent = true
    }
  }

  eks_managed_node_groups = {
    default = {
      name           = "eks_node"
      min_size       = 2
      max_size       = 4
      desired_size   = 2
      instance_types = var.aws_eks_managed_node_groups_instance_types
      capacity_type  = "SPOT"

      tags = merge(
        var.aws_project_tags,
        {
          "k8s.io/cluster-autoscaler/enabled" : "true",
          "k8s.io/cluster-autoscaler/${var.aws_project_name}-eks" : "owned"
        }
      )
    }
  }

  tags = var.aws_project_tags
}
