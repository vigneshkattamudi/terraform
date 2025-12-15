resource "aws_instance" "ec2_instance" {
  count = length(var.instances) # count based loop is a list always
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.all-allow.id]

  tags = {
    Name = var.instances[count.index]
  }
}

resource "aws_security_group" "all-allow" {
  name        = "all-allow"
  description = "Allow all traffic"

  dynamic "ingress" {
    for_each = var.instances
    content {
      from_port   = ingress.value["from_port"] #name.value["namespace"]
      to_port     = ingress.value["to_port"]
      protocol    = var.protocol
      cidr_blocks = var.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.instances
    content {
      from_port   = ingress.value["from_port"] #name.value["namespace"]
      to_port     = ingress.value["to_port"]
      protocol    = var.protocol
      cidr_blocks = var.cidr_blocks
    }
  }

 

  tags = {
    Name = "allow-all"
  }
}
