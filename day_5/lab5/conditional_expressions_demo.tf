terraform {
  required_version = "0.14.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "=3.27.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  secret_key = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
}

variable "istest" {}

resource "aws_instance" "dev" {
  ami           = "ami-08e0ca9924195beba"
  instance_type = "t2.micro"
  count         = var.istest == true ? 3 : 0
}

resource "aws_instance" "prod" {
  ami           = "ami-08e0ca9924195beba"
  instance_type = "t2.large"
  count         = var.istest == false ? 3 : 0
}