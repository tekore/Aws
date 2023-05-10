# work in progress

#resource "aws_route53_record" "domain" {
#  zone_id = aws_route53_zone.primary.zone_id
#  name    = "www."
#  type    = "A"
#  ttl     = 300
#  records = [aws_eip.cloud.public_ip]
#}
