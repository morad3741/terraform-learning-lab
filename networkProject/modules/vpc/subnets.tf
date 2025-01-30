resource "aws_subnet" "public_subnets" {
 count      = length(var.public_subnet_cidrs)
 vpc_id = aws_vpc.project_vpc.id
 cidr_block = element(var.public_subnet_cidrs, count.index)
 map_public_ip_on_launch = true
 availability_zone = element(data.aws_availability_zones.available_AZ.names,count.index)
 tags = {
   Name = "Public Subnet ${count.index + 1}"
 }
}


