# work in progress

#resource "aws_route53_zone" "public" {
#  name = "example.com"
#}

#resource "aws_route53_record" "domain" {
#  zone_id = aws_route53_zone.public.zone_id
#  name    = "www."
#  type    = "A"
#  ttl     = 300
#  records = [aws_eip.eip.public_ip]
#}
