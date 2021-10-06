#INTERNET GATEWAY OUTPUTS

#public subnet vpc id
output "vpc_id" {
    value = aws_vpc.main1.id
}
#Public subnet ID
output "pub_sub" {
    value = aws_subnet.public_IGW.id
}
#route table id
output "pub_rt" {
    value =aws_route_table.public_IGW.id
}


#---------------------------------------------------------------------------------------------------------------------------------------

#NAT GATEWAY OUTPUTS


output "gateway_id" {
    value = aws_nat_gateway.nat.id
}
output "public_rt" {
    value = aws_route_table.public_NAT_GW.id
}
output "private_rt" {
    value =aws_route_table.private.id
}


#---------------------------------------------------------------------------------------------------------------------------------------


