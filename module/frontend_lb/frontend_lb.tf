resource "aws_lb_target_group" "ui_service_alb_tg" {
  name        = "ui-service-alb-tg"
  target_type = "ip"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
}

resource "aws_lb" "front_end" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.lb_sg_ids
  subnets            = var.lb_subnet_ids
}

resource "aws_lb_listener" "name" {
  load_balancer_arn = aws_lb.front_end.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ui_service_alb_tg.arn
  } 
}