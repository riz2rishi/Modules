



#####################################################################################
####################################### ec2_mod #####################################


source = "./module/ec2"
    region = "us-east-1"    
profile = "terraform-rishi-aws"
ami = {east1 = "ami-087c17d1fe0178315", east2 = "ami-00dfe2c7ce89a450b", west-1="ami-011996ff98de391d1",west-2="ami-0c2d06d50ce30b442"}
instanceType = "t2.micro"
index =0


#---------------------------------------------------------------------------------------------------------------------------------------

#Custom AMIs (Golden Images)

size =  40
rootDevName = "/dev/xvda"
DevName = "/dev/xvda"

#---------------------------------------------------------------------------------------------------------------------------------------
#ASG
des_capacity = 1
maxSize = 1
minSize = 1
namePrefix = "foobar"
imgID = "ami-087c17d1fe0178315"

#----------------------------------------------------------------------------------------------------------

#Auto Start - Stop

timeout = "300"

#----------------------------------------------------------------------------------------------------------

#Automated Session Manager in Private network
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
name               = "NAME OF YOUR APPLICATION"
private_start_ip   = "30"
public_start_ip    = "20"
subnet_prefix      = "10.0"
vpc_cidr           = "10.0.0.0/16"
  
}