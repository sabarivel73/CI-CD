resource "aws_lb_target_group" "backend" {
  name        = "backend-target-group"
  port        = 8080
  protocol    = "HTTP"
  target_type = "ip"

  vpc_id = aws_vpc.main.id

  health_check {
    enabled             = true
    path                = "/actuator/health"
    protocol            = "HTTP"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 3
    interval            = 30
    timeout             = 5
    matcher             = "200"
  }
}