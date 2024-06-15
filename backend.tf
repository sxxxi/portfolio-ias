terraform {
  backend "s3" {
    bucket = "terraform-seejay"
    key    = "portfolio/terraform.state"
    region = "us-east-1"
  }
}