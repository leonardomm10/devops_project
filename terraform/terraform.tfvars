aws_region       = "us-east-1"
aws_project_name = "devops"

aws_vpc_cidr            = "10.0.0.0/16"
aws_vpc_azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
aws_vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
aws_vpc_public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

aws_eks_version                            = "1.29"
aws_eks_managed_node_groups_instance_types = ["t3.medium"]

aws_rds_engine            = "mysql"
aws_rds_engine_version    = "5.7"
aws_rds_storage_type      = "gp2"
aws_rds_allocated_storage = "10"
aws_rds_instance_class    = "db.t3.micro"

aws_project_tags = {
  Terraform   = "true"
  Environment = "staging"
  Project     = "devops"
}