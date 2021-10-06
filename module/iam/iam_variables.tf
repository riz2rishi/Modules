

variable "aws_new_user" {
    description = "Aws new user"
   
    type        = string
  
}


variable "aws_new_group" {
    description = "Aws new group"
    
    type        = string
  
}

variable "policy_data" {
    description = "policy for the group"
    type = map(any)
    
  
}



