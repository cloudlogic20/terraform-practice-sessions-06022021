data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("${path.module}/demo-kp.pub")
}

resource "aws_instance" "myec2" {
  ami             = "ami-04b1ddd35fd71475a"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.loginkey.key_name
  security_groups = [aws_security_group.demo_sg.name]

  tags = {
    Name = "HelloWorld-KR"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("${path.module}/demo-kp")
      host        = self.public_ip
    }
  }
}

resource "aws_security_group" "demo_sg" {
  name        = "allow_all"
  description = "All traffic allowed"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}