provider "aws" {
  region     = "ap-south-1"
  access_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  secret_key = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
}

terraform {
  required_version = "0.14.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "=3.27.0"
    }
  }
}

resource "aws_instance" "web" {
  ami           = "ami-08e0ca9924195beba"
  instance_type = "t2.micro"
  key_name      = "cloudkey"

  tags = {
    Name = "HelloWorld-KR-Demo"
  }
}


resource "aws_key_pair" "deployer" {
  key_name   = "cloudkey"
  public_key = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
}
