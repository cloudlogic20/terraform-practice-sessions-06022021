terraform {
  backend "s3" {
    bucket = "cloudlogic20-tfstate"
    key    = "terraformdemo.tfstate"
    region = "ap-south-1"
  }
}
