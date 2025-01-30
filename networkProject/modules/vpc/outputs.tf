
output "vpc_id" {
    value = aws_vpc.project_vpc.id
}

output "public_subnet1_id" {
  value = aws_subnet.public_subnets[0].id
}

output "public_subnet2_id" {
  value = aws_subnet.public_subnets[1].id
}

output "public_subnets_obj" {
  value = aws_subnet.public_subnets
}

output "public_subnet1_az" {
  value = data.aws_availability_zones.available_AZ.names[0]
}

output "public_subnet2_az" {
  value = data.aws_availability_zones.available_AZ.names[1]
}