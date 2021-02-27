resource "aws_instance" "cloudlogic" {
  ami           = "ami-04b1ddd35fd71475a"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld-KR"
  }
}

resource "aws_iam_user" "dummyuser" {
  name = var.iam_user
  path = "/system/"
}
