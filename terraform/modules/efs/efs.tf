resource "aws_efs_file_system" "eks_efs" {
  creation_token   = "${var.aws_project_name}-efs"
  performance_mode = "generalPurpose"
  encrypted        = true

  tags = merge(
    var.aws_project_tags,
    {
      Name = "${var.aws_project_name}-efs"
    }
  )
}

resource "aws_efs_mount_target" "main" {
  count = length(var.aws_vpc_private_subnets)

  file_system_id  = aws_efs_file_system.eks_efs.id
  subnet_id       = var.aws_vpc_private_subnets[count.index]
  security_groups = [aws_security_group.efs.id]
}