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
module "s3" {
  source = "./s3.tf"

  bucket_name = var.bucket_name
  index_file_path = var.index_file_path
}

module "cloudfront" {
  source = "./cloudfront.tf"

  bucket_name = var.bucket_name
  index_file_path = var.index_file_path
}