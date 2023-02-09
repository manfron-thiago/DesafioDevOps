# Executa Instancia do EC2
resource "aws_launch_template" "web" {
  image_id      = var.ami_id
  instance_type = var.instance_type
}