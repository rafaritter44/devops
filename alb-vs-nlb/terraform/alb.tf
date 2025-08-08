resource "aws_lb" "alb" {
  name               = "alb-http"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
  security_groups    = [aws_security_group.app_sg.id]
}

resource "aws_lb_target_group" "alb_tg_a" {
  name     = "alb-tg-http-a"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  health_check {
    port                = "5000"
    protocol            = "HTTP"
    path                = "/health"
    matcher             = "200"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
  }
}

resource "aws_lb_target_group" "alb_tg_b" {
  name     = "alb-tg-http-b"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  health_check {
    port                = "5000"
    protocol            = "HTTP"
    path                = "/health"
    matcher             = "200"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
  }
}

resource "aws_lb_target_group_attachment" "alb_http_a" {
  count            = 2
  target_group_arn = aws_lb_target_group.alb_tg_a.arn
  target_id        = aws_instance.http_server_a[count.index].id
  port             = 5000
}

resource "aws_lb_target_group_attachment" "alb_http_b" {
  target_group_arn = aws_lb_target_group.alb_tg_b.arn
  target_id        = aws_instance.http_server_b.id
  port             = 5000
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 5000
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg_a.arn
  }
}

resource "aws_lb_listener_rule" "alb_path_a" {
  listener_arn = aws_lb_listener.alb_listener.arn
  priority     = 10
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg_a.arn
  }
  condition {
    path_pattern {
      values = ["/a*"]
    }
  }
}

resource "aws_lb_listener_rule" "alb_path_b" {
  listener_arn = aws_lb_listener.alb_listener.arn
  priority     = 20
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg_b.arn
  }
  condition {
    path_pattern {
      values = ["/b*"]
    }
  }
}