################################################################################
# Backend
################################################################################

terraform {
  backend "s3" {
    bucket = "my-bucket"
    key    = "tf/terraform.tfstate"
    region = "us-east-1"
  }
}