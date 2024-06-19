variable "aws_region" {
  description = "The region where AWS resources will be created"
  type        = string
  nullable    = false
}

variable "aws_project_name" {
  description = "The name of the project"
  type        = string
  nullable    = false
}

variable "aws_project_tags" {
  description = "Tags for the AWS project"
  type        = map(any)
  nullable    = false
}

variable "aws_vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  nullable    = false
}

variable "aws_vpc_azs" {
  description = "The availability zones for the VPC"
  type        = set(string)
  nullable    = false
}

variable "aws_vpc_private_subnets" {
  description = "The private subnets within the VPC"
  type        = set(string)
  nullable    = false
}

variable "aws_vpc_public_subnets" {
  description = "The public subnets within the VPC"
  type        = set(string)
  nullable    = false
}

variable "aws_eks_version" {
  description = "The version of the EKS cluster"
  type        = string
  nullable    = false
}

variable "aws_eks_managed_node_groups_instance_types" {
  description = "The instance types for the EKS managed node groups"
  type        = set(string)
  nullable    = false
}

variable "aws_rds_engine" {
  type     = string
  nullable = false
}

variable "aws_rds_engine_version" {
  type     = string
  nullable = false
}

variable "aws_rds_storage_type" {
  type     = string
  nullable = false
}

variable "aws_rds_allocated_storage" {
  type     = string
  nullable = false
}

variable "aws_rds_instance_class" {
  type     = string
  nullable = false
}

variable "aws_rds_username" {
  type     = string
  nullable = false
}

variable "aws_rds_password" {
  type     = string
  nullable = false
}