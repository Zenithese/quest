resource "tls_private_key" "zenithese" {
  algorithm = "RSA"
}

resource "tls_self_signed_cert" "zenithese" {
  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.zenithese.private_key_pem

  subject {
    common_name  = "zenithese.com"
  }

  validity_period_hours = 12

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

resource "aws_acm_certificate" "zenithese" {
  private_key      = tls_private_key.zenithese.private_key_pem
  certificate_body = tls_self_signed_cert.zenithese.cert_pem
}