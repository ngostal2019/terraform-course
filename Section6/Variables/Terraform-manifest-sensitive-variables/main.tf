resource "aws_db_instance" "tfm-mariadb" {
  allocated_storage   = var.allocated_storage
  db_name             = var.db_name
  availability_zone   = var.availability_zone
  count               = var.db_instance_count
  engine              = var.db_engine
  instance_class      = var.db_instance_class["t3micro"]
  engine_version      = var.engine_version
  multi_az            = var.multi_az
  password            = var.db_password
  username            = var.db_username
  skip_final_snapshot = var.skip_final_snapshot
  publicly_accessible = var.publicly_accessible
  tags                = var.tags
}
