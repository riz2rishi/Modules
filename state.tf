terraform{
    backend "s3" {
        bucket = "riz-cicd-pipeline"#put your bucket name
        encrypt = true
        key = "landingzone/terraform.tfstate"
        region = "us-west-2"#update the region
        profile = "terraform-rishi-aws"
    }
}


provider "aws" {
  profile = "rishi-terraform-aws"
  region  = var.aws_region
}
