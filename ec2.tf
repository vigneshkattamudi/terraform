resource "aws_instance" "terraform-ec2" {
  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-instance"
  }
}

resource "aws_security_group" "allow-all" {
  name        = "allow-all"
  description = "Allow all traffic"

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
    Name = "allow-all"
  }
}
