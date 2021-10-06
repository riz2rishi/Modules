

variable "aws_vpc_cidr" {
    description = "CIDR block for VPC"
   
    type = string
  
}

variable "public_subnet_cidr" {
    description = "CIDR block for VPC Subnet"
  
    type = string
  
}


variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    type = string
}

variable "aws_vpc_sub_az" {

    description = "VPC subnet availability zone  "
    
    type = string
   
}


