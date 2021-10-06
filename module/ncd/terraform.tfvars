
region = "ap-south-1"     #Set correct region for console
profile = "terraform-rishi-aws" #Set correct profile name for console


#INTERNET GATEWAT TFVARS

vpc_cidr_ncd = "10.0.0.0/18"
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