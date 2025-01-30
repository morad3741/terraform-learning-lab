terraform {
  backend "s3" {
    bucket = "dudi-terraform-state"
    key = "network_project_terraform.tfstate"
    region = "us-west-2"
  }
}