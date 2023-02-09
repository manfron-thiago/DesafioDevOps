terraform {
  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

# Configurando o AWS Provider
provider "aws" {
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}

# Os module a seguir estão referenciando as Variáveis
module "autoscaling_group" {
  source = "./autoscaling_group.tf"

  name= var.autoscaling_group_name
  max_size = var.autoscaling_group_max_size
  min_size = var.autoscaling_group_min_size
  desired_capacity = var.autoscaling_group_desired_capacity
  health_check_type = var.autoscaling_group_health_check_type
  launch_template_id = var.launch_template_id
}

module "launch_templatep" {
  source = "./launch_template.tf"
  
  image_id = var.ami_id
  instance_type = var.instance_type
}

module "security_group" {
  source = "./security_group.tf"
  
  name = var.security_group_name
  description = var.security_group_description
  cidr_blocks = [var.vpc_cidr]
}

module "instance" {
  source = "./instance.tf"
  
  ami = var.ami_id
  instance_type = var.instance_type
  var.instance_name
}

module "html_file" {
  source = "./html_file.tf"
  
  html_file = var.html_file
  private_key = file(var.private_key_path)
}