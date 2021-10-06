variable "aws_region" {

    default = "us-west-2"
  
}

####################################################################################
####################################### vpc-mod ####################################

variable "cidr_vpc" {
    type=string
  
}

variable "public_subnet" {
  type=string
}

variable "private_subnet" {
    type=string
  
}

variable "vpc_subnet_az" {
    type=string
  
}


#####################################################################################
####################################### vpc_peering ################################

variable "mod_aws_region_peer"{

    description = "peering vpc region"
    type=string
}
variable "mod_aws_profile"{

    description = "aws profile for peering connection"
    type = string
}
variable "mod_vpc_main_subnet_cidr"{

    description = "vpc main subnet"
    type = string
}
variable "mod_vpc_peer_subnet_cidr"{

    description = "vpc peer subnet"
    type = string
}
variable "mod_aws_vpc_sub_az"{

    description = "vpc az"
    type = string
}



#####################################################################################
####################################### org_mod #####################################


variable "aws_ou_name" {
    type = list(string)
}

variable "org_enabled_policy" {
     type = list(string)
  
}



#####################################################################################
####################################### iam_mod #####################################
variable "aws_user_name" {
    type = string
  
}

variable "aws_group_name" {
    type = string
  
}


variable "aws_policy_data" {

    type =map(any)
  
}



#####################################################################################
####################################### ec2_mod #####################################

variable "ami_id"{
  description = "AMI ID "
  type = string
  
}
variable "instance_Type"{
  description = "Type of instance"
  type = string
}


#####################################################################################
####################################### alb_mod #####################################

variable "mod_lb_enable_deletion_protection" {
    description = "deletion protection for ALB"
    type = bool
  
}

variable "mod_lb_type" {
    description = "Load Balancer Type"
    type = string

  
}

variable "mod_aws_vpc_cidr" {
    description = "vpc cidr for ALB"
    type = string
  
}

variable "mod_lb_subnet_count" {
    description = "Number of subnets to be associated with the Lb"
    
  
}
variable "mod_public_subnet_cidr" {
     description="List Public subnets"
     type=list(string)
  
}
variable "mod_alb_vpc_sub_az" {
    description="List availability zones for lb"
    type=list(string)
  
}

variable "mod_lb_listener_rule_priority" {
   description="Sets the rule priority for lb listener"

}
