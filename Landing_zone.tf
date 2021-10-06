


module "ec2" {

    source = var.source 
    region = var.region
profile = var.profile
ami = var.ami
instanceType = var.instanceType
index = var.index


#---------------------------------------------------------------------------------------------------------------------------------------

#Custom AMIs (Golden Images)

size =  var.size
rootDevName = var.rootDevName
DevName = var.DevName

#---------------------------------------------------------------------------------------------------------------------------------------
#ASG
des_capacity = var.des_capacity
maxSize = var.maxSize
minSize = var.minSize
namePrefix = var.namePrefix
imgID = var.imgID

#----------------------------------------------------------------------------------------------------------

#Auto Start - Stop

timeout = var.timeout

#----------------------------------------------------------------------------------------------------------

#Automated Session Manager in Private network
availability_zones = var.availability_zones
name               = var.name
private_start_ip   = var.private_start_ip
public_start_ip    = var.public_start_ip
subnet_prefix      = var.subnet_prefix
vpc_cidr           = var.vpc_cidr
  
}
    
