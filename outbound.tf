resource "aws_route53_resolver_endpoint" "outbound" {
  #  name = var.r53_outbound
  name      = "DWP-OUTBOUND-DEV"
  direction = "OUTBOUND"
  #  security_group_ids = [aws_security_group.dwp-outbound.id]
  security_group_ids = var.security_group_id
  ip_address  { 
    subnet_id = "subnet-0ed5ddeb80ca60485" 
    }
  ip_address {
    subnet_id = "subnet-0b08be68013ec6970" 
    }
  #   ip_address {
  #     subnet_id = var.subnet_id
  #   }
  #   ip_address {
  #     subnet_id = var.subnet_id
  #   }
}

resource "aws_route53_resolver_rule" "fwd" {
  domain_name = "corp.clouddeepdive.org" # Add your domain name here
  #  name = var.r53_rule
  name                 = "DWP-OUTBOUND-RULE"
  rule_type            = "FORWARD"
  resolver_endpoint_id = aws_route53_resolver_endpoint.outbound.id
  target_ip {
    ip = "192.168.10.97" #Add the on prem DNS IP here
  }
  target_ip {
    ip = "192.168.10.240" #Add the on prem DNS IP here
  }
}

resource "aws_route53_resolver_rule_association" "vpc" {
  resolver_rule_id = aws_route53_resolver_rule.fwd.id
  vpc_id           = var.mainvpc
}