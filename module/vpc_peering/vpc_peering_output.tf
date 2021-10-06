output "vpc_id_main" {

    value = aws_vpc.main.id
  
}

output "vpc_id_peer" {

    value = aws_vpc.peer.id
  
}

output "peering_connection" {

    value = aws_vpc_peering_connection.peer.id
  
}