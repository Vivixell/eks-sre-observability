output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  value = [for s in aws_subnet.public : s.id]
}

output "private_subnet_ids" {
  value = [for s in aws_subnet.private : s.id]
}

output "private_route_table_id" {
  description = "Attach future VPC endpoints (for example S3 gateway) here"
  value       = aws_route_table.private.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.regional.id
}

output "vpc_endpoint_security_group_id" {
  description = "Reuse for future interface endpoints (sts, logs, etc.)"
  value       = aws_security_group.vpc_endpoints.id
}