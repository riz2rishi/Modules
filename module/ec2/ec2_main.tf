#EC2 Instance created
resource "aws_instance" "new_instance" {
  #  count = var.enable_instance ? 1:0
    ami = var.ami.east1[count.index] #type required region for AMI
    instance_type = var.instanceType[count.index]
}

#---------------------------------------------------------------------------

#CUSTOM AMIs (Golden Image)


#Creation of EBS volume
resource "aws_ebs_volume" "example" {
  #count = var.enable_custom_ami ? 1:0
  availability_zone = var.az.east1a #Put Required availability zone 
  size              = var.size

  tags = {
    Name = "HelloWorld"
  }
}

#EBS Snapshot 
resource "aws_ebs_snapshot" "example_snapshot" {
 # count = var.enable_custom_ami ? 1:0
  volume_id = aws_ebs_volume.example.id

  tags = {
    Name = "HelloWorld_snap"
  }
}

resource "aws_ami" "example" {
  #count = var.enable_custom_ami ? 1:0
  name                = "terraform-example"
  virtualization_type = "hvm"
  root_device_name    = var.rootDevName
  
  ebs_block_device {
    device_name = var.DevName
    snapshot_id = aws_ebs_snapshot.example_snapshot.id
    volume_size = 45
  }
}


#------------------------------------------------------------------------------------------

#Creation of Autoscaling Groups



#Creating launch template
resource "aws_launch_template" "foobar" {
  #count = var.enable_asg ? 1:0
  name_prefix   = var.namePrefix
  image_id      = var.imgID
  instance_type = "t2.micro"
}
#Creating autoscaling group
resource "aws_autoscaling_group" "bar" {
  #count = var.enable_asg ? 1:0
  availability_zones = [var.az.east1a , var.az.east1b]
  desired_capacity   = var.des_capacity
  max_size           = var.maxSize
  min_size           = var.minSize

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}



#-------------------------------------------------------------------------------------------------------

#Auto Start Stop of EC2 instance



resource "aws_iam_role" "lambda_role" {
  #count = var.enable_auto_start_stop ? 1:0
  name = "EC2-Auto-Stop-Lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "lambda_policy" {
  name = "EC2-Auto-Stop"

  policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
       {
           "Effect": "Allow",
           "Action": [
               "ec2:DescribeInstances",
               "ec2:DescribeRegions",
               "ec2:StopInstances"
           ],
           "Resource": "*"
       }
   ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_basic_policy_attachment" {
  role       = "${aws_iam_role.lambda_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "lambda_main_policy_attachment" {
  role       = "${aws_iam_role.lambda_role.name}"
  policy_arn = "${aws_iam_policy.lambda_policy.arn}"
}

data "archive_file" "lambda_code" {
  type        = "zip"
  source_file = "./module/ec2/lambda.js"
  output_path = "./module/ec2/lambda.zip"
}

resource "aws_lambda_function" "lambda_function" {
  #count = var.enable_auto_start_stop ? 1:0
  filename         = "${data.archive_file.lambda_code.output_path}"
  function_name    = "EC2-Auto-Stop"
  role             = "${aws_iam_role.lambda_role.arn}"
  handler          = "lambda.handler"
  source_code_hash = "${base64sha256(filebase64("${data.archive_file.lambda_code.output_path}"))}"
  runtime          = "nodejs14.x"
  timeout          = var.timeout
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  #count = var.enable_auto_start_stop ? 1:0
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.lambda_function.function_name}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.daily_stop.arn}"
}

resource "aws_cloudwatch_event_rule" "daily_stop" {
  #count = var.enable_auto_start_stop ? 1:0
  name                = "Daily-EC2-Stop-instances"
  description         = "Stops the instances"
  schedule_expression = "cron(0 16 * * ? *)"
}

resource "aws_cloudwatch_event_target" "lambda_trigger" {
  #count = var.enable_auto_start_stop ? 1:0
  rule      = "${aws_cloudwatch_event_rule.daily_stop.name}"
  target_id = "${aws_lambda_function.lambda_function.function_name}"
  arn       = "${aws_lambda_function.lambda_function.arn}"
}


#----------------------------------------------------------------------------------------------------------

#Automated Sessions Manager in private network
  
locals {
  count = length(var.availability_zones)
  name  = replace(var.name, "-", "_")
}
#Creation of VPC
resource "aws_vpc" "this" {
  #count = var.enable_auto_sess_manager ? 1:0
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = upper("VPC_${local.name}")
    Product = var.name
  }
}

#Creating security group for the network
resource "aws_default_security_group" "default" {
  #count = var.enable_auto_sess_manager ? 1:0
  vpc_id = aws_vpc.this.id
  tags = {
    Product = var.name
  }
}

resource "aws_internet_gateway" "this" {
  #count = var.enable_auto_sess_manager ? 1:0
  vpc_id = aws_vpc.this.id
  tags = {
    Name    = upper("IGW_${local.name}")
    Product = var.name
  }
}
#NAT Gateway creation
resource "aws_nat_gateway" "this" {
  #count = var.enable_auto_sess_manager ? 1:0
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element(aws_subnet.public.*.id, 0)
  depends_on    = [aws_internet_gateway.this]

  tags = {
    Name    = "${var.name}-nat-gateway"
    Product = var.name
  }
}
