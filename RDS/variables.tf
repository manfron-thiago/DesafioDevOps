# Variáveis de Ambiente
variable "region" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "db_instance_identifier" {
  type = string
  default = "" // O nome da instância do RDS
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "security_group_name" {
  type = string
  default = "" // O nome do security group 
}

variable "security_group_description" {
  type = string
  default = "" // Descrição do security group 
}

variable "db_engine" {
  type = string
  default = "mysql" 
}

variable "db_engine_version" {
  type = string
  default = "8.0"
}

variable "db_instance_class" {
  type = string
  default = "db.t2.micro"
}