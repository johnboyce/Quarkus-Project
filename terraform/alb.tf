resource "aws_alb" "main" {
  name            = var.ecs_alb_name
  subnets         = [for subnet in aws_subnet.private_subnets : subnet.id]
  security_groups = [aws_security_group.lb.id]
  ip_address_type = "ipv4"

}

resource "aws_security_group" "lb" {
  name   = var.aws_sg_name
  vpc_id = aws_vpc.main.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = var.app_port
    protocol    = "tcp"
    to_port     = var.app_port
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}

resource "aws_alb_target_group" "app" {
  name        = "demo-ecs-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = var.health_check_path
    unhealthy_threshold = "2"
  }
}

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.main.id
  port              = var.app_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.app.id
    type             = "forward"
  }
}