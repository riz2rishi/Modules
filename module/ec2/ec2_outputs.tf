output "aws_INSTANCE_ID" {
    value = aws_instance.new_instance.id
}

#----------------------------------------------------------------------------------------------------------

#Custom AMIs

output "snapID" {
    value = aws_ebs_snapshot.example_snapshot.id
}

#----------------------------------------------------------------------------------------------------------

#ASG

output "launch_template_ID" {
    value = aws_launch_template.foobar.id
}

#----------------------------------------------------------------------------------------------------------

#Auto Start - Stop

