module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = "${var.aws_project_name}-vpc"
  cidr = var.aws_vpc_cidr

  azs             = var.aws_vpc_azs
  private_subnets = var.aws_vpc_private_subnets
  public_subnets  = var.aws_vpc_public_subnets

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    # "kubernetes.io/cluster/${var.aws_eks_name}" = "shared"
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    # "kubernetes.io/cluster/${var.aws_eks_name}" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }

  tags = merge(
    var.aws_project_tags,
    {
      # "kubernetes.io/cluster/${var.aws_eks_name}" = "shared" 
    }
  )
}