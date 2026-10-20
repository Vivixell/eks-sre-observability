# Interface endpoints must be reachable on 443 from anything in the VPC (nodes, pods).
resource "aws_security_group" "vpc_endpoints" {
  name        = "${var.cluster_name}-vpc-endpoints"
  description = "HTTPS from the VPC to interface endpoints"
  vpc_id      = aws_vpc.main.id

  tags = { Name = "${var.cluster_name}-vpc-endpoints" }
}

resource "aws_vpc_security_group_ingress_rule" "vpc_endpoints_https" {
  security_group_id = aws_security_group.vpc_endpoints.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
  description       = "HTTPS from VPC"
}

# ECR needs both: api (auth, manifests via ecr API) and dkr (the Docker registry endpoint).
resource "aws_vpc_endpoint" "ecr_interface" {
  for_each = toset(["ecr.api", "ecr.dkr"])

  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.${each.key}"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = [for s in aws_subnet.private : s.id]
  security_group_ids  = [aws_security_group.vpc_endpoints.id]
  private_dns_enabled = true

  tags = { Name = "${var.cluster_name}-${each.key}" }
}

# Image layers are served from S3. This is where the real data savings come from.
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.private.id]

  tags = { Name = "${var.cluster_name}-s3" }
}