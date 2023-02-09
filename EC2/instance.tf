# Cria Instancia EC2
resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }

  vpc_security_group_ids = [
    aws_security_group.web.id,
  ]
}