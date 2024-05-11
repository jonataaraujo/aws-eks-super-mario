################################################################################
# Backend
################################################################################

terraform {
  backend "s3" {
    bucket = "example-my-bucket"
    key    = "tf/k8s-super-mario.tfstate"
    region = "us-east-1"
  }
}
