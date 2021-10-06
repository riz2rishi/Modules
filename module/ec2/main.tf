#EC2 Instance created
resource "aws_instance" "new_instance" {
    ami = var.ami
    instance_type = var.instanceType
}