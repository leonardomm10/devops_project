output "cluster_name" {
  value = module.aws_eks.aws_eks_name
}

output "rds_endpoint" {
  value = module.aws_rds.aws_rds_endpoint
}

output "efs_file_system_id" {
  value = module.aws_efs.efs_file_system_id
}