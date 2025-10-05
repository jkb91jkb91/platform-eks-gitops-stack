locals {
  ssm_endpoints = [
    "com.amazonaws.${var.region}.ssm",
    "com.amazonaws.${var.region}.ec2messages",
    "com.amazonaws.${var.region}.ssmmessages",
  ]
}

resource "aws_vpc_endpoint" "ssm" {
  for_each            = toset(local.ssm_endpoints)
  vpc_id              = aws_vpc.this.id
  service_name        = each.value
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids          = [aws_subnet.private_a.id, aws_subnet.private_b.id]
  security_group_ids  = [aws_security_group.vpce.id]
  tags = { Name = "${var.vpc_name}-${replace(each.value, "com.amazonaws.${var.region}.", "")}" }
}