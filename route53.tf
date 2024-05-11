################################################################################
# Route53 Resource
################################################################################

resource "aws_route53_record" "main" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${var.dns}.${data.aws_route53_zone.main.name}"
  type    = "CNAME"
  ttl     = 60
  records = [kubernetes_service.main.status[0].load_balancer[0].ingress[0].hostname]

  depends_on = [
    kubernetes_service.main,
  ]
}