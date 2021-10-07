variable "aws_region" {

    default = "us-west-2"
  
}



#####################################################################################
####################################### ec2_mod #####################################

#variables for instance creation
variable "region"{
    description = " Name of region "
    type = string
       
}
variable "profile"{
  description = "Name of profile"
  type = string
  
}
variable "enable_instance" {
  type = bool
  description = " Want to deploy EC2 instance ? (true / false)"
}
variable "ami"{
  description = "AMI ID "
  type = map(any)
    
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
  
}
variable "enable_custom_ami" {
  type = bool
  description = " Want to deploy custom AMI ? (true / false)"
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
variable "enable_asg" {
  description = "Want to deploy Auto Scaling Groups ? (true/false)"
  type = bool
}
variable "des_capacity" {
  description = "Desired capacity of ASG"
  type = number
  default = 1
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


variable "timeout" {
  type = string
  description = " Duration for timeout"
  
}
variable "enable_auto_start_stop" {
  type = bool 
  description = "Want to enable auto start - stop functionality for EC2 instance ? (true /false)"
}


#------------------------------------Auto Sessions Manager--------------------------------------

variable "enable_auto_sess_manager" {
  description = "Want to enable Automatic Sessions Manager ? (true/false)"
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

#-----------------------------------------------------------------------------------------------------------------

#----------------------------------------------ncd----------------------------------------------------------------
variable "vpc_cidr_ncd" {
description = "VPC CIDR "
type = string
default = "10.0.0.0/18"
}
variable "pub_cidr" {
    description = "Public network CIDR"
    type = string
    default = "10.0.0.0/24"
}
variable "cidr_rt" {
    description = "Routing table CIDR"
    type = string
    default = "0.0.0.0/0"
}

#-------------------------------------------------------------------------------------------------------------------------------------------


#NAT GATEWAY VARIABLES

variable "priv_cidr" {
    type = string 
    default = "10.0.1.0/24"
}


#-------------------------------------------------------------------------------------------------------------------------------------------

#ROUTE53 HEALTH CHECK VARIABLES

variable "hc_name" {
  description = "The name of the check"
  
}

variable "fqdn" {
  description = "The fully qualified domain name of the endpoint to be checked"
  type = bool
}

variable "port" {
  description = "The port of the endpoint to be checked"
  type = number
}

variable "protocol_type" {
  description = "The protocol to use when performing health checks. Valid values are HTTP, HTTPS, HTTP_STR_MATCH, HTTPS_STR_MATCH, TCP, CALCULATED and CLOUDWATCH_METRIC"
  type = string
}

variable "resource_path" {
  description = "The path that you want Amazon Route 53 to request when performing health checks."
}

variable "failure_threshold" {
  description = "The number of consecutive health checks that an endpoint must pass or fail."
  type = string
}

variable "request_interval" {
  description = "The number of seconds between the time that Amazon Route 53 gets a response from your endpoint and the time that it sends the next health-check request."
  type = string
}

variable "sns_topic" {
  description = "SNS topic where publish alert"
}
variable "namespace" {
    type = string
    description = "Cloudwatch namespace"
}
variable "metric_name" {
    type = string 
    description = "Cloudwatch Metric Name"
}

variable "comparison_operator" {
    type = string
}

variable "evaluation_periods" {
    type = string 
}
variable "period" {
    type = string 
}
variable "statistic" {
    type = string
}
variable "threshold" {
    type = string
}
variable "unit" {
    type = string 
}

variable "treat_missing_data" {
    type = string
}

#-------------------------------------------------------------------------------------------------------------------------------------


#ROUTE53 RECORDS

variable "record_enabled" {
  type        = bool
  description = "Whether to create Route53 record set."
}

variable "record_type" {
  type        = string
  description = "The record type. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT. "
}

variable "ttl" {
  type        = number
  description = "(Required for non-alias records) The TTL of the record."
}

variable "r53_rec_name" {
  type        = string
  description = "The name of the record."
}

variable "values" {
  type        = string
  description = "(Required for non-alias records) A string list of records. To specify a single record value longer than 255 characters such as a TXT record for DKIM, add \"\" inside the Terraform configuration string (e.g. \"first255characters\"\"morecharacters\")."
}

variable "set_identifier" {
  type        = string
  description = "Unique identifier to differentiate records with routing policies from one another. Required if using failover, geolocation, latency, or weighted routing policies documented below."
}

variable "alias" {
  type        = map(any)
  description = "An alias block. Conflicts with ttl & records. Alias record documented below."
}

variable "multivalue_answer_routing_policy" {
  
  description = "Set to true to indicate a multivalue answer routing policy. Conflicts with any other routing policy."
}

variable "allow_overwrite" {
  type        = bool
  description = "Allow creation of this record in Terraform to overwrite an existing record, if any. This does not affect the ability to update the record in Terraform and does not prevent other resources within Terraform or manual Route 53 changes outside Terraform from overwriting this record. false by default. This configuration is not recommended for most environments."
}

variable "zone_name" {
  type = string 
  description = "Name of zone"
}

#------------------------------------------------------------------------------------------------------------------------------------------