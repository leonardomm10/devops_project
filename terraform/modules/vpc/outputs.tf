output "aws_vpc_id" {
  value = module.vpc.vpc_id
}

output "aws_vpc_public_subnets" {
  value = module.vpc.public_subnets
}

output "aws_vpc_private_subnets" {
  value = module.vpc.private_subnets
}

output "aws_vpc_cidr_blocks" {
  value = module.vpc.vpc_cidr_block
}

output "aws_vpc_azs" {
  value = module.vpc.azs
}