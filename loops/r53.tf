resource "aws_route53_record" "www" {
  count = length(var.instances)
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}" #mongodb.dsops84.space
  type    = "A"
  ttl     = 1
  records = [aws_instance.ec2_instance[count.index].private_ip]
  allow_overwrite = true
}