


resource "random_pet" "pet_name" {
  length    = 3
  separator = "-"
}




#user
resource "aws_iam_user" "new_user" {
  name = var.aws_new_user
}


#group
resource "aws_iam_group" "new_group" {
  name = var.aws_new_group   
}




#adding user-1 to group developers

resource "aws_iam_user_group_membership" "new_group" {
  user = aws_iam_user.new_user.name

  groups = [
    aws_iam_group.new_group.name,
    
  ]
}

#Attaching a policy to user
resource "aws_iam_user_policy_attachment" "attachment" {
  user       = aws_iam_user.new_user.name
  policy_arn = aws_iam_policy.policy.arn
}


#Attaching a policy to group
resource "aws_iam_group_policy_attachment" "attach_group" {
  group       = aws_iam_group.new_group.name
  policy_arn = aws_iam_policy.policy.arn
  
}

