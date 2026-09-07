resource "aws_ecs_cluster" "backend" {
  name = "backend-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}