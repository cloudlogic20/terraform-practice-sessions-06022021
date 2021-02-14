terraform {
  required_version = "0.14.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "=3.28.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  secret_key = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
}

resource "aws_instance" "cloudlogic" {
  ami           = "ami-08e0ca9924195beba"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld-KR-Demo"
  }
}

resource "aws_eip" "myeip" {
  instance = aws_instance.cloudlogic.id
}