resource "aws_route53_record" "www" {
  #count = length(var.instances)
  for_each = aws_instance.ec2_instance
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" #mongodb.dsops84.space
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
  allow_overwrite = true
}