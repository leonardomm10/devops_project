resource "aws_security_group" "rds" {
  name        = "${var.aws_project_name}-rds-sg"
  description = "Allows inbound rds traffic from vpc"
  vpc_id      = var.aws_vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
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