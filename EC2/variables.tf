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

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
  default = "" // O tipo da instância do EC2
}

variable "instance_name" {
  type = string
  default = "" // O nome da instância EC2
}

variable "security_group_name" {
  type = string
  default = "" // O nome do grupo de segurança
}

variable "security_group_description" {
  type = string
  default = "" // A descrição do grupo de segurança
}

variable "autoscaling_group_name" {
  type = string
  default = "" // O nome do grupo de escalonamento automático
}

variable "autoscaling_group_min_size" {
  type = number
  default = "" // O número mínimo de instâncias no grupo de escalonamento automático
}

variable "autoscaling_group_max_size" {
  type = number
  default = "" // O número máximo de instâncias no grupo de escalonamento automático
}

variable "autoscaling_group_desired_capacity" {
  type        = number
  default = "" // O número desejado de instâncias no grupo de escalonamento automático
}

variable "autoscaling_group_health_check_type" {
  type = string 
   default = "" // O tipo de verificação de integridade realizada pelo grupo de escalonamento automático
}

variable "private_key_path" {
  type = string
}

variable "instance_username" {
  type = string
}

variable "html_file" {
  type = string
  default = "${file("./index.html")}" // Adicione aqui a URL do arquivo para ler
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}