# Cria uma distribuição CloudFront com um certificado ACM associado e configurações padrão de cache
resource "aws_cloudfront_distribution" "static_website_distribution" {
  origin {
    domain_name = aws_s3_bucket.static_website_bucket.bucket_regional_domain_name
    origin_id = "${var.bucket_name}"
  }

  default_cache_behavior {
    target_origin_id = "${var.bucket_name}"
    allowed_methods = ["GET", "HEAD"]
    cached_methods = ["GET", "HEAD"]
    forwarded_values {
      query_string = false
    }
    viewer_protocol_policy = "redirect-to-https"
  }

  enabled = true
  is_ipv6_enabled = true

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.certificate.arn
    ssl_support_method = "sni-only"
  }
}

resource "aws_acm_certificate" "certificate" {
  domain_name = "${var.bucket_name}"
  validation_method = "DNS"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}