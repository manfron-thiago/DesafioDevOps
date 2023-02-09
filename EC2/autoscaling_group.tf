# Cria um grupo de autoscaling
resource "aws_autoscaling_group" "web" {
  name = var.autoscaling_group_name
  max_size = var.autoscaling_group_max_size
  min_size = var.autoscaling_group_min_size
  desired_capacity = var.autoscaling_group_desired_capacity
  health_check_type = var.autoscaling_group_health_check_type
  launch_template_id = var.launch_template_id

  tag = {
    key = "AutoscalingGrupo"
    value = var.autoscaling_group_name
    propagate_at_launch = true
  }
}