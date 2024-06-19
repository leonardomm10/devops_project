output "aws_eks_name" {
  value = module.eks.cluster_name
}

output "aws_eks_endpoint" {
  value = module.eks.cluster_endpoint
}

output "aws_eks_cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

output "aws_eks_oidc_provider" {
  value = module.eks.oidc_provider
}

output "aws_eks_oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}