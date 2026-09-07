resource "aws_lb" "backend" {
  name               = "backend-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    "security_groups_id"
  ]

  subnets = [
    "subnet.public_a.id",
    "subnet.public_b.id"
  ]
}
