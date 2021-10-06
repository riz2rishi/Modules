#variables for instance creation
variable "region"{
    description = " Name of region "
    type = string
    default = "us-east-1"    
}
variable "profile"{
  description = "Name of profile"
  type = string
  default= "AWS_CIL"
}
variable "ami"{
  description = "AMI ID "
  type = map(any)
    default= {east1 = "ami-087c17d1fe0178315", east2 = "ami-00dfe2c7ce89a450b", west-1="ami-011996ff98de391d1",west-2="ami-0c2d06d50ce30b442"}
}
variable "instanceType"{
  description = "Type of instance"
  type = string
  default= "t2.micro"
}

variable "index" {
    description = "Index number"
    type = number
    default=0
}

#-------------------------------------------------------------------------------------------------------



#Golden Image   (need to put list of AZs)

variable "az" {
    description = "Name of AZ"
  type = map(any)
  default= {east1a = "us-east-1a" , east1b = "us-east-1b"}
}
variable "size" {
    description = "Size"
  type = number
  default=  40
}
variable "rootDevName" {
    description = "Root Device Name"
  type = string
  default=  "/dev/xvda"
}
variable "DevName" {
  description = "Device name of block"
  type = string
  default = "/dev/xvda"
}

#------------------------------------------------------------------------------------------------------------


#ASG Variables

variable "des_capacity" {
  description = "Desired capacity of ASG"
  type = number
  default = 1
}
variable "maxSize" {
  description = "Maximum size of ASG"
  type = number
  default = 1
}
variable "minSize" {
  description = "Minimum size of ASG"
  type = number
  default = 1
}

variable "namePrefix" {
  description = "Name Prefix of AWS launch Template"
  type = string
  default = "foobar"
}

variable "imgID" {
  description = "Image ID of launch template"
  type = string
  default = "ami-087c17d1fe0178315"
}


#----------------------------------------------------------------------------------------



#Auto Start - Stop


variable "timeout" {
  type = string
  description = " Duration for timeout"
  default ="300"
}


#------------------------------------

variable "availability_zones" {
  description = "AWS AVailability Zones"
  type        = list
}

variable "name" {
  description = "Application Name"
  type        = string
}

variable "public_start_ip" {
  description = "Start ip of public subnets"
  type        = string
}

variable "private_start_ip" {
  description = "Start ip of private subnets"
  type        = string
}

variable "subnet_prefix" {
  description = "Prefix for setup of subnets"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR of the VPC"
  type        = string
}

locals {
  az_count = length(var.availability_zones)
}