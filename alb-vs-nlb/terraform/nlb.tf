resource "aws_lb" "nlb" {
  name               = "nlb-tcp"
  internal           = false
  load_balancer_type = "network"
  subnets            = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
}

resource "aws_lb_target_group" "nlb_tg" {
  name     = "nlb-tg-tcp"
  port     = 6000
  protocol = "TCP"
  vpc_id   = aws_vpc.main.id
  health_check {
    port                = "6000"
    protocol            = "TCP"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
  }
}

resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = 6000
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "nlb_tcp" {
  count            = 2
  target_group_arn = aws_lb_target_group.nlb_tg.arn
  target_id        = aws_instance.tcp_server[count.index].id
  port             = 6000
}