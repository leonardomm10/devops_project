module "aws_vpc" {
  source = "./modules/vpc"

  aws_region       = var.aws_region
  aws_project_name = var.aws_project_name
  aws_project_tags = var.aws_project_tags

  aws_vpc_cidr            = var.aws_vpc_cidr
  aws_vpc_azs             = var.aws_vpc_azs
  aws_vpc_private_subnets = var.aws_vpc_private_subnets
  aws_vpc_public_subnets  = var.aws_vpc_public_subnets
}

module "aws_rds" {
  source = "./modules/rds"

  aws_project_name = var.aws_project_name
  aws_project_tags = var.aws_project_tags

  aws_vpc_id              = module.aws_vpc.aws_vpc_id
  aws_vpc_private_subnets = module.aws_vpc.aws_vpc_private_subnets
  aws_vpc_cidr_blocks     = module.aws_vpc.aws_vpc_cidr_blocks
  aws_vpc_azs             = module.aws_vpc.aws_vpc_azs

  aws_rds_engine            = var.aws_rds_engine
  aws_rds_engine_version    = var.aws_rds_engine_version
  aws_rds_storage_type      = var.aws_rds_storage_type
  aws_rds_allocated_storage = var.aws_rds_allocated_storage
  aws_rds_instance_class    = var.aws_rds_instance_class
  aws_rds_username          = var.aws_rds_username
  aws_rds_password          = var.aws_rds_password
}

module "aws_efs" {
  source = "./modules/efs"

  aws_project_name = var.aws_project_name
  aws_project_tags = var.aws_project_tags

  aws_vpc_id              = module.aws_vpc.aws_vpc_id
  aws_vpc_private_subnets = module.aws_vpc.aws_vpc_private_subnets
  aws_vpc_cidr_blocks     = module.aws_vpc.aws_vpc_cidr_blocks
}

module "aws_eks" {
  source = "./modules/eks"

  aws_project_name = var.aws_project_name
  aws_project_tags = var.aws_project_tags

  aws_vpc_id              = module.aws_vpc.aws_vpc_id
  aws_vpc_private_subnets = module.aws_vpc.aws_vpc_private_subnets

  aws_eks_version                            = var.aws_eks_version
  aws_eks_managed_node_groups_instance_types = var.aws_eks_managed_node_groups_instance_types
}

module "helm" {
  source = "./modules/helm"

  aws_region = var.aws_region

  aws_eks_name              = module.aws_eks.aws_eks_name
  aws_eks_oidc_provider     = module.aws_eks.aws_eks_oidc_provider
  aws_eks_oidc_provider_arn = module.aws_eks.aws_eks_oidc_provider_arn

  depends_on = [module.aws_eks]
}