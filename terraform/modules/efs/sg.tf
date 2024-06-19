resource "aws_security_group" "efs" {
  name        = "${var.aws_project_name}-efs-sg"
  description = "Allows inbound efs traffic from vpc"
  vpc_id      = var.aws_vpc_id

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [var.aws_vpc_cidr_blocks]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.aws_project_tags
}