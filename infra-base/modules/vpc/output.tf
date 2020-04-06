output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_cidr_block" {
  value = aws_vpc.this.cidr_block
}

output "private_subnets" {
  value = aws_subnet.private.*.id
}

output "private_subnets_cidr_blocks" {
  value = aws_subnet.private.*.cidr_block
}

output "public_subnets" {
  value = aws_subnet.public.*.id
}

output "public_subnets_cidr_blocks" {
  value = aws_subnet.public.*.cidr_block
}
