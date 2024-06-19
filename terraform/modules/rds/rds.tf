resource "aws_db_subnet_group" "aws_rds_subnet" {
  name       = "${var.aws_project_name}-rds-subnet"
  subnet_ids = [for subnet in var.aws_vpc_private_subnets : subnet]
}

resource "aws_db_instance" "aws_rds" {
  identifier          = "${var.aws_project_name}-rds"
  engine              = var.aws_rds_engine
  engine_version      = var.aws_rds_engine_version
  storage_type        = var.aws_rds_storage_type
  allocated_storage   = var.aws_rds_allocated_storage
  instance_class      = var.aws_rds_instance_class
  username            = var.aws_rds_username
  password            = var.aws_rds_password
  availability_zone   = var.aws_vpc_azs[0]
  publicly_accessible = false
  skip_final_snapshot = true

  db_subnet_group_name   = aws_db_subnet_group.aws_rds_subnet.id
  vpc_security_group_ids = [aws_security_group.rds.id]
}