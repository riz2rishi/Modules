output "alb_name" {

    value = aws_lb.lb_new.name
  
}

output "alb_arn" {
    value = aws_lb.lb_new.arn
  
}

output "alb_target_group_name" {
  value = aws_lb_target_group.lb_target_group.name
}

output "alb_listner" {
  value = aws_lb_listener.front_end_forward.arn
  
}

output "vpc_id" {
  value = aws_vpc.lb_vpc.id
}

output "instance_arn" {
  value = aws_instance.test.arn
}