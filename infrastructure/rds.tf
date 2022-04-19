resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "backend_store" {
  identifier          = "${local.name}-db"
  allocated_storage   = 5
  engine              = var.db_engine
  engine_version      = var.db_version
  instance_class      = var.db_instance_class
  db_name             = local.db_name
  username            = local.db_username
  password            = random_password.password.result
  port                = local.db_port
  skip_final_snapshot = true
  publicly_accessible = true

  tags = merge(
    {
      Name = "${local.name}-rds"
    },
    local.tags
  )
}