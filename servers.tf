resource "aws_instance" "rearc-quest-terraform" {
  ami = "ami-0ff8a91507f77f867"
  instance_type = "t2.micro"
  key_name = var.ami_key_pair_name
  security_groups = [aws_security_group.rearc-quest-terraform-sg.id]
  subnet_id = aws_subnet.subnet-uno.id
}