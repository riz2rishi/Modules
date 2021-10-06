



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
az = {east1a = "us-east-1a" , east1b = "us-east-1b"}
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
  
#----------------------------------------------------------------------------------------------------------
#-----------------------------------------------ncd--------------------------------------------------------

source = "./module/ncd"


#INTERNET GATEWAT TFVARS

vpc_cidr = "10.0.0.0/18"
pub_cidr = "10.0.0.0/24"
cidr_rt = "0.0.0.0/0"


#----------------------------------------------------------------------------------------------------------------------------------------

#NAT GATEWAY TFVARS

priv_cidr = "10.0.1.0/24"

#----------------------------------------------------------------------------------------------------------------------------------------

#ROUTE53 HEALTH CHECK TFVARS

hc_name = false
fqdn = false
port = 80
resource_path = false
failure_threshold = "3"
request_interval = "30"
protocol_type = "HTTP"
sns_topic = ""
namespace = "AWS/Route53"
metric_name = "HealthCheckStatus"
comparison_operator = "LessThanThreshold"
evaluation_periods = "1"
period = "60"
statistic = "Minimum"
threshold = "1"
unit = "None"
treat_missing_data = "breaching"

#----------------------------------------------------------------------------------------------------------------------------------------

#ROUTE53 RECORDS TFVARS


record_enabled = true
r53_rec_name = "www"
set_identifier = null
multivalue_answer_routing_policy = null
allow_overwrite = false
zone_name = "rishiabcd.com"
values = "10.0.0.27"
alias = {}
ttl = 3600
record_type = "A"