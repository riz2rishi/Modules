#variables for instance creation
variable "region"{
    description = " Name of region "
    type = string
      
}
variable "profile"{
  description = "Name of profile"
  type = string
  
}

variable "ami"{
  description = "AMI ID "
  type = map(any)
    
}
#variables for instance creation
variable "enable_instance" {
  type = bool
  
  description = " Want to deploy EC2 instance ? (true / false)"
}
variable "instanceType"{
  description = "Type of instance"
  type = string
  
}

variable "index" {
    description = "Index number"
    type = number
    
}

#-------------------------------------------------------------------------------------------------------



#Golden Image   (need to put list of AZs)
variable "enable_custom_ami" {
  type = bool
  
  description = " Want to deploy custom AMI ? (true / false)"
}

variable "az" {
  description = "Name of AZ"
  type = map(any)
  
}
variable "size" {
  description = "Size"
  type = number
  
}
variable "rootDevName" {
  description = "Root Device Name"
  type = string
  
}
variable "DevName" {
  description = "Device name of block"
  type = string
  
}

#------------------------------------------------------------------------------------------------------------


#ASG Variables
variable "enable_asg" {
  description = "Want to deploy Auto Scaling Groups ? (true/false)"
  
  type = bool
}
variable "des_capacity" {
  description = "Desired capacity of ASG"
  type = number
  
}
variable "maxSize" {
  description = "Maximum size of ASG"
  type = number
  
}
variable "minSize" {
  description = "Minimum size of ASG"
  type = number
  
}

variable "namePrefix" {
  description = "Name Prefix of AWS launch Template"
  type = string
  
}

variable "imgID" {
  description = "Image ID of launch template"
  type = string
  
}


#----------------------------------------------------------------------------------------



#Auto Start - Stop
variable "enable_auto_start_stop" {
  type = bool 
  
  description = "Want to enable auto start - stop functionality for EC2 instance ? (true /false)"
}

variable "timeout" {
  type = string
  description = " Duration for timeout"
  
}


#------------------------------------Automated Sessions Manager---------------------------------------------------------

variable "enable_auto_sess_manager" {
  
  description = "Want to deploy automatic session manager ? (true/false)"
  type = bool
}
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