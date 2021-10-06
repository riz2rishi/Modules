variable "aws_region"{
    description = "AWS_Region"
    default = "us-east-2"
    type = string


}

variable "aws_region_peer"{
    description = "AWS_Region for peering"
    default = "us-east-1"
    type = string

}

variable "aws_profile"{
    description = "AWS_profile"
    default = "terraform-practice"
    type = string


}


variable "vpc_main_subnet_cidr" {
    description = "CIDR block for VPC main Subnet"
    default = "10.0.0.0/16"
    type = string
  
}


variable "vpc_peer_subnet_cidr" {
    description = "CIDR for the VPC peer Subnet"
    default = "10.1.0.0/16"
}

variable "aws_vpc_sub_az" {

    description = "VPC subnet availability zone  "
    default = "us-west-2a"
    type = string
   
}

