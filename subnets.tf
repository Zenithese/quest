resource "aws_subnet" "subnet-uno" {
  cidr_block = "${cidrsubnet(aws_vpc.rearc-quest-terraform-env.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.rearc-quest-terraform-env.id}"
  availability_zone = "us-east-1a"
}

resource "aws_route_table" "route-table-rearc-quest-terraform-env" {
  vpc_id = "${aws_vpc.rearc-quest-terraform-env.id}"
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.rearc-quest-terraform-env-gw.id}"
    }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = "${aws_subnet.subnet-uno.id}"
  route_table_id = "${aws_route_table.route-table-rearc-quest-terraform-env.id}"
}