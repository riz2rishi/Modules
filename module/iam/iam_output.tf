output "user_name" {

    value = aws_iam_user.new_user.name
  
}

output "user_arn" {
  
  value = aws_iam_user.new_user.arn
}


output "group_name" {
  
  value = aws_iam_group.new_group.name
}

output "group_arn" {
  
  value = aws_iam_group.new_group.arn
}

output "policy_json" {

    value = aws_iam_policy.policy
  
}
output "policy_arn" {
  
  value = aws_iam_policy.policy.arn
}