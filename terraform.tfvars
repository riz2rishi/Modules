
####################################################################################
####################################### vpc-mod ####################################

cidr_vpc="10.0.0.0/16"
public_subnet="10.0.0.0/24"
private_subnet="10.0.1.0/24"
vpc_subnet_az="us-west-2a"

#####################################################################################
####################################### vpc_peering #################################

mod_aws_region_peer="us-east-1"
mod_aws_profile="terraform-practice"
mod_vpc_main_subnet_cidr="10.0.0.0/16"
mod_vpc_peer_subnet_cidr="10.1.0.0/16"
mod_aws_vpc_sub_az="us-west-2a"

#####################################################################################
####################################### org_mod #####################################

aws_ou_name=["Security Account","Log Archive","Shared Services Account"]
org_enabled_policy=["SERVICE_CONTROL_POLICY"]




#####################################################################################
####################################### iam_mod #####################################

aws_user_name  = "user-1"
aws_group_name = "Developers"
aws_policy_data  = {
            actions   = "s3:ListAllMyBuckets"
            resources = "arn:aws:s3:::*"
             effect    = "Allow"
}



#####################################################################################
####################################### ec2_mod #####################################

ami_id = "ami-0c2d06d50ce30b442"
instance_Type = "t2.micro"

#####################################################################################
####################################### alb_mod #####################################


mod_lb_enable_deletion_protection   = false
mod_lb_type                      = "application"
mod_aws_vpc_cidr                 = "10.0.0.0/16"
mod_lb_subnet_count              = 2
mod_public_subnet_cidr           = ["10.0.0.0/24","10.0.1.0/24"]
mod_alb_vpc_sub_az               = ["us-west-2a","us-west-2b"]
mod_lb_listener_rule_priority    = 100
