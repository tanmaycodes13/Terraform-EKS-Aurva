terraform {
  backend "s3" {
    bucket = "terraform-aurva-test"
    key = "terraform"
    region = "us-west-2"
  }
}
