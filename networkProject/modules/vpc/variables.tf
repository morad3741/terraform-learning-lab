variable "vpc_name" {
  type = string
  default = "My Project VPC"
  description = "my best var for region"
}

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
  description = "65,536 ips - 10.0.0.0 - 10.0.255.255"
}

variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

