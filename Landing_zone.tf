
module "iam_user_1_mod" {

    source = "./module/iam"

    aws_new_user  = var.aws_user_name
    aws_new_group = var.aws_group_name
    policy_data  =  var.aws_policy_data
    
    
  
}


module "vpc_mod" {

    
    source = "./module/vpc"
    
    aws_vpc_cidr             = var.cidr_vpc
    public_subnet_cidr       = var.public_subnet
    private_subnet_cidr      = var.private_subnet
    aws_vpc_sub_az           = var.vpc_subnet_az

  
}


module "org_mod" {

    source = "./module/org"
    aws_OU_name     = var.aws_ou_name
    aws_enabled_policy  = var.org_enabled_policy
  
}


module "ec2" {

    source = "./module/ec2"
    ami = var.ami_id
    instanceType = var.instance_Type
  
  
}
    
module "vpc_peering_mod"{

    source = "./module/vpc_peering"


    aws_region_peer=var.mod_aws_region_peer
    aws_profile=var.mod_aws_profile
    vpc_main_subnet_cidr=var.mod_vpc_main_subnet_cidr
    vpc_peer_subnet_cidr=var.mod_vpc_peer_subnet_cidr
    aws_vpc_sub_az=var.mod_aws_vpc_cidr


}
module "alb_mod" {

    source = "./module/alb"

    enable_deletion_protection   = var.mod_lb_enable_deletion_protection
    lb_type                      = var.mod_lb_type
    aws_vpc_cidr                 = var.mod_aws_vpc_cidr
    lb_subnet_count              = var.mod_lb_subnet_count
    public_subnet_cidr           = var.mod_public_subnet_cidr
    aws_vpc_sub_az               = var.mod_alb_vpc_sub_az
    lb_listener_rule_priority    = var.mod_lb_listener_rule_priority

  
}
