resource "aws_vpc" "main" {
  cidr_block = var.vpc_main_subnet_cidr
}

resource "aws_vpc" "peer" {
  provider   = aws.east
  cidr_block = var.vpc_peer_subnet_cidr
}

data "aws_caller_identity" "peer" {
  provider = aws.east
}

# Requester's side of the connection.
resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = aws_vpc.main.id
  peer_vpc_id   = aws_vpc.peer.id
  peer_owner_id = data.aws_caller_identity.peer.account_id
  peer_region   = var.aws_region_peer
  auto_accept   = false

}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                  = aws.east
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true

}