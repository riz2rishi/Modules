resource "aws_acm_certificate" "example" {
  domain_name       = "example435terrform.com"
  validation_method = "EMAIL"
}

/*
resource "aws_acm_certificate_validation" "example" {
  certificate_arn = aws_acm_certificate.example.arn
}

*/