module "vpc" {
    source = "./modules/vpc"
}

output "vpc_id" {
    value = module.vpc.vpc_id
}

output "public_subnet1_id" {
  value = module.vpc.public_subnet1_id
}

output "public_subnet2_id" {
  value = module.vpc.public_subnet2_id
}

output "public_subnets_obj" {
  value = module.vpc.public_subnets_obj
}
