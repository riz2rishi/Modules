
variable "aws_OU_name" {
  description = "Name for the AWS Org unit "  
  
  type = list(string)
}

variable "aws_enabled_policy"{
    description = "List of Enabled policy types for AWS Organization"
    
    type = list(string)
}

/*
variable "aws_account_Org_usr"{
    description = "name for the organization account"
    default = ["user-3","user-4"]
    type=list(string)  
}

variable "aws_account_Org_usr_email"{
    description = "email for the organization account"
    default = ["av9152@srmist.edu.in","arul_saxena@srmuniv.edu.in"]
    type=list(string)
}

*/