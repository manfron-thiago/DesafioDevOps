# Configurando o Bucket
resource "aws_s3_bucket" "static_website_bucket" {
  bucket = var.bucket_name
}

# Configurado Política de Acesso
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.static_website_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "s3:GetObject",
        Effect = "Allow",
        Principal = "*",
        Resource = "${aws_s3_bucket.static_website_bucket.arn}/*",
        Sid = "PublicReadForGetBucketObjects"
      }
    ]
  })
}

# Adicionando website ao Bucket
resource "aws_s3_bucket_website" "bucket_website" {
  bucket = aws_s3_bucket.static_website_bucket.id
  index_document = var.index_file_path
}