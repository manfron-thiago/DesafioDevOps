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
module "instance" {
  source = "./instance.tf"

  identifier = var.db_instance_identifier
  name = var.db_name
  username = var.db_username
  password = var.db_password
  engine = var.db_engine
  engine_version = var.db_engine_version
  instance_class = var.db_instance_class
}

module "security_group" {
  source = "./security_group.tf"

  name = var.security_group_name
  description = var.security_group_description
  cidr_blocks = [var.vpc_cidr]
}