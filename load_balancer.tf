resource "aws_lb" "rearc-quest-terraform-lb" {
  name               = "rearc-quest-terraform-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.rearc-quest-terraform-sg.id]
  subnets            = [aws_subnet.rearc-quest-terraform-subnet.id, aws_subnet.rearc-quest-terraform-subnet-2.id]
}

resource "aws_lb_target_group" "rearc-quest-terraform-tg" {
  name = "rearc-quest-terraform-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.rearc-quest-terraform-env.id
}

resource "aws_lb_target_group" "rearc-quest-terraform-tg-3000" {
  name = "rearc-quest-terraform-tg-3000"
  port = 3000
  protocol = "HTTP"
  vpc_id = aws_vpc.rearc-quest-terraform-env.id
}

resource "aws_lb_listener" "rearc-quest-terraform-lb-listener" {
  load_balancer_arn = aws_lb.rearc-quest-terraform-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.rearc-quest-terraform-tg.arn
  }
}

resource "aws_lb_listener" "rearc-quest-terraform-lb-listener-3000" {
  load_balancer_arn = aws_lb.rearc-quest-terraform-lb.arn
  port              = "3000"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.rearc-quest-terraform-tg-3000.arn
  }
}

resource "aws_lb_target_group_attachment" "rearc-quest-terraform-tga" {
  target_group_arn = aws_lb_target_group.rearc-quest-terraform-tg.arn
  target_id = aws_instance.rearc-quest-terraform.id
  port = 80
}

resource "aws_lb_target_group_attachment" "rearc-quest-terraform-tga-3000" {
  target_group_arn = aws_lb_target_group.rearc-quest-terraform-tg-3000.arn
  target_id = aws_instance.rearc-quest-terraform.id
  port = 3000
}