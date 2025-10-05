locals {
  ssm_endpoints = [
    "com.amazonaws.${var.region}.ssm",
    "com.amazonaws.${var.region}.ec2messages",
    "com.amazonaws.${var.region}.ssmmessages",
  ]
  common_tags = {
    Project     = var.project_name
    Environment = var.environment_name
    Cluster     = var.cluster_name
  }
}

resource "aws_vpc_endpoint" "ssm" {
  for_each            = toset(local.ssm_endpoints)
  vpc_id              = var.vpc_id
  service_name        = each.value
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids          = [var.private_subnet_for_bastion_host_id]
  security_group_ids  = [aws_security_group.vpce.id]
  tags = merge(local.common_tags, {
    Name = "${var.vpc_name}-vpc-endpoints"
  })
}

#SG for VPC Endpoints, allow for 443 from BASTION
resource "aws_security_group" "vpce" {
  name   = "${var.vpc_name}-vpce-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "bastion" {
  name        = "${var.vpc_name}-bastion-sg"
  description = "Bastion over SSM (no inbound)"
  vpc_id      = var.vpc_id

  # Brak ingress — nie wystawiamy żadnych portów

  # Egress: pełny, aby bastion mógł wyjść do VPCE (443) i ewentualnie innych usług w VPC
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }

  tags = merge(local.common_tags, {
    Name = "${var.vpc_name}-bation-sg"
  })
}