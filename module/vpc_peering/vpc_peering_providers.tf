
provider "aws" {

  alias = "east"
  profile = var.aws_profile
  region = var.aws_region_peer
  
}
