terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.48.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.13.2"
    }
    # kubernetes = {
    #   source  = "hashicorp/kubernetes"
    #   version = "2.30.0"
    # }
  }
  backend "s3" {}
}

provider "aws" {
  region = var.aws_region
}

provider "helm" {
  kubernetes {
    host                   = module.aws_eks.aws_eks_endpoint
    cluster_ca_certificate = base64decode(module.aws_eks.aws_eks_cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", "${var.aws_project_name}-eks"]
      command     = "aws"
    }
  }
}

# provider "kubernetes" {
#   host                   = module.aws_eks.aws_eks_endpoint
#   cluster_ca_certificate = base64decode(module.aws_eks.aws_eks_cluster_certificate_authority_data)
#   exec {
#     api_version = "client.authentication.k8s.io/v1beta1"
#     args        = ["eks", "get-token", "--cluster-name", "${var.aws_project_name}-eks"]
#     command     = "aws"
#   }
# }