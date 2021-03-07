resource "aws_instance" "myec2" {
  ami                    = "ami-0eeb03e72075b9bcc"
  instance_type          = "t2.large"
  vpc_security_group_ids = ["sg-01b8b570f3c340752"]
  key_name               = "demo-kp"
  subnet_id              = "subnet-5e1c5e12"

  tags = {
    Name = "manual-demo"
  }
}


