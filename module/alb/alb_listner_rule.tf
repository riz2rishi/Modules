# Load Balancer Listener Rule

resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.front_end_forward.arn
  priority     = var.lb_listener_rule_priority

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }

  condition {
    path_pattern {
      values = ["/static/*"]
    }
  }

  condition {
    host_header {
      values = ["example.com"]
    }
  }
}