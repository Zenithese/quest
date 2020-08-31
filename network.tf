resource "aws_vpc" "rearc-quest-terraform-env" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_eip" "ip-rearc-quest-terraform-env" {
  instance = aws_instance.rearc-quest-terraform.id
  vpc      = true
}