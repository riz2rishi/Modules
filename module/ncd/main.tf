# INTERNET GATEWAY

#create VPC
resource "aws_vpc" "main1" {
  cidr_block = var.vpc_cidr_ncd
}
#creating public subnet
resource "aws_subnet" "public_IGW" {
  vpc_id     = aws_vpc.main1.id
  cidr_block = var.pub_cidr

}
#creating internet gateway
resource "aws_internet_gateway" "igw_1" {
    vpc_id = aws_vpc.main1.id
}
#creating public routing table
resource "aws_route_table" "public_IGW" {
    vpc_id = aws_vpc.main1.id
    #routing configuration
    route {
    cidr_block = var.cidr_rt
    gateway_id = aws_internet_gateway.igw_1.id
    }
}
#public route table association
resource "aws_route_table_association" "public_IGW" {
    subnet_id = aws_subnet.public_IGW.id
    route_table_id = aws_route_table.public_IGW.id
}

#--------------------------------------------------------------------------------------------------------------------------------------

#NAT GATEWAY

#create VPC
resource "aws_vpc" "main2" {
  cidr_block = var.vpc_cidr_ncd
}
#creating public subnet
resource "aws_subnet" "public_NAT_GW" {
  vpc_id     = aws_vpc.main2.id
  cidr_block = var.pub_cidr

}
#Creating Private subnet
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.main2.id
    cidr_block = var.priv_cidr
}
#creating internet gateway
resource "aws_internet_gateway" "igw_2" {
    vpc_id = aws_vpc.main2.id
}
#elastic ip for NAT gateway
resource "aws_eip" "nat_eip" {
    vpc = true
    depends_on = [aws_internet_gateway.igw_2]
}
#Main Nat gateway for VPC
resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.public_NAT_GW.id
}
#creating public routing table
resource "aws_route_table" "public_NAT_GW" {
    vpc_id = aws_vpc.main2.id
    #routing configuration
    route {
    cidr_block = var.cidr_rt
    gateway_id = aws_internet_gateway.igw_2.id
    }
}
#public route table association
resource "aws_route_table_association" "public_NAT_GW" {
    subnet_id = aws_subnet.public_NAT_GW.id
    route_table_id = aws_route_table.public_NAT_GW.id
}

#route table for private subnet
resource "aws_route_table" "private" {
    vpc_id =aws_vpc.main2.id
    route {
        cidr_block = var.cidr_rt
        gateway_id = aws_nat_gateway.nat.id
    }
}
#Association between private subnet and private route table
resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private.id
}


#-----------------------------------------------------------------------------------------------------------------------------------------

#ROUTE53 HEALTH CHECK

resource "aws_route53_health_check" "check" {
  fqdn              = var.fqdn
  port              = var.port
  type              = var.protocol_type
  resource_path     = var.resource_path
  failure_threshold = var.failure_threshold
  request_interval  = var.request_interval

  tags = {
    Name = var.hc_name
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm" {
  alarm_name          = "${var.hc_name}_alarm_healthcheck_failed"
  namespace           = var.namespace
  metric_name         = var.metric_name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  period              = var.period
  statistic           = var.statistic
  threshold           = var.threshold
  unit                = var.unit

  dimensions = {
    HealthCheckId = aws_route53_health_check.check.id
  }

  alarm_description         = "This metric monitors ${var.hc_name} whether the service endpoint is down or not."
  ok_actions             = [var.sns_topic]
  alarm_actions             = [var.sns_topic]
  insufficient_data_actions = [var.sns_topic]
  treat_missing_data        = var.treat_missing_data 
}

#----------------------------------------------------------------------------------------------------------------------------------------

#ROUTE53 RECORDS

#Create Route53 record sets resource on AWS.
resource "aws_route53_record" "default" {
  count                            = var.record_enabled && length(var.alias) == 0 ? 1 : 0
  zone_id                          = aws_route53_zone.primary.zone_id
  name                             = var.r53_rec_name
  type                             = var.record_type
  ttl                              = var.ttl
  records                          = split(",", var.values)
  set_identifier                   = var.set_identifier
 
  multivalue_answer_routing_policy = var.multivalue_answer_routing_policy
  allow_overwrite                  = var.allow_overwrite
}

#Terraform module to create Route53 record sets resource on AWS.
resource "aws_route53_record" "alias" {
  count                            = var.record_enabled && length(var.alias) > 0 ? 1 : 0
  zone_id                          = aws_route53_zone.primary.zone_id
  name                             = var.r53_rec_name
  type                             = var.record_type
  set_identifier                   = var.set_identifier
  
  multivalue_answer_routing_policy = var.multivalue_answer_routing_policy
  allow_overwrite                  = var.allow_overwrite
  alias {
    name                   = var.alias["name"]
    zone_id                = aws_route53_zone.primary.zone_id
    evaluate_target_health = var.alias["evaluate_target_health"]
  }
}
resource "aws_route53_zone" "primary" {
  name = var.zone_name
}


#------------------------------------------------------------------------------------------------------------------------------------------------