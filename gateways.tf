resource "aws_internet_gateway" "rearc-quest-terraform-env-gw" {
  vpc_id = aws_vpc.rearc-quest-terraform-env.id
}