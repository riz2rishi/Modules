


module "ec2" {

    source = "./module/ec2"
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
    
#------------------------------------------ncd--------------------------------------------------------------------------------------
module "ncd" {
    source = "./module/ncd"
#INTERNET GATEWAT TFVARS

vpc_cidr_ncd = var.vpc_cidr_ncd
pub_cidr = var.pub_cidr
cidr_rt = var.cidr_rt


#----------------------------------------------------------------------------------------------------------------------------------------

#NAT GATEWAY TFVARS

priv_cidr = var.priv_cidr

#----------------------------------------------------------------------------------------------------------------------------------------

#ROUTE53 HEALTH CHECK TFVARS

hc_name = var.hc_name
fqdn = var.fqdn
port = var.port
resource_path = var.resource_path
failure_threshold = var.failure_threshold
request_interval = var.request_interval
protocol_type = var.protocol_type
sns_topic = var.sns_topic
namespace = var.namespace
metric_name = var.metric_name
comparison_operator = var.comparison_operator
evaluation_periods = var.evaluation_periods
period = var.period
statistic = var.statistic
threshold = var.threshold
unit = var.unit
treat_missing_data = var.treat_missing_data

#----------------------------------------------------------------------------------------------------------------------------------------

#ROUTE53 RECORDS TFVARS


record_enabled = var.record_enabled
r53_rec_name = var.r53_rec_name
set_identifier = var.set_identifier
multivalue_answer_routing_policy = var.multivalue_answer_routing_policy
allow_overwrite = var.allow_overwrite
zone_name = var.zone_name
values = var.values
alias = var.alias
ttl = var.ttl
record_type = var.record_type
}

#-------------------------------------------------------------------------------------------------------------