# Cria um Security Group que permite o tráfego de entrada apenas de uma sub-rede específica (10.0.0.0/16)
resource "aws_security_group" "rds_sg" {
  name = var.security_group_name
  description = var.security_group_description

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}