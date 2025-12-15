resource "aws_instance" "ec2_instance" {
  count                  = length(var.instances) # count based loop is a list always
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.all-allow.id]

  tags = {
    Name = var.instances[count.index]
  }
}

resource "aws_security_group" "all-allow" {
  name        = "all-allow"
  description = "Allow all traffic"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value["from_port"] #name.value["namespace"]
      to_port     = ingress.value["to_port"]
      protocol    = var.protocol
      cidr_blocks = var.cidr_blocks
    }
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
