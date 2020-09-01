resource "aws_instance" "rearc-quest-terraform" {
  ami = "ami-0ff8a91507f77f867"
  instance_type = "t2.micro"
  key_name = "myKeyPair"
  user_data = "${file("script.sh")}"
  security_groups = [aws_security_group.rearc-quest-terraform-sg.id]
  subnet_id = aws_subnet.rearc-quest-terraform-subnet.id
}