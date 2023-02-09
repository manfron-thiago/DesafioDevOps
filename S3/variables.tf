# Variáveis de Ambiente
variable "bucket_name" {
  type = string
  default = "" // Inserir nome padrão para o bucket
}

variable "index_file_path" {
  type = string
  default = "index.html" // Inserir URL do arquivo
}

variable "region" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}