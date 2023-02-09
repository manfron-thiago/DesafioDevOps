# cria uma instância RDS com o banco de dados MySQL
resource "aws_db_instance" "rds" {
  identifier = var.db_instance_identifier
  engine = var.db_engine
  engine_version = var.db_engine_version
  instance_class = var.db_instance_class
  name = var.db_name
  username = var.db_username
  password = var.db_password
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot = true
  publicly_accessible = false
}