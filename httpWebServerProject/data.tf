data "terraform_remote_state" "network_state" {
    backend = "s3"

  config = {
    bucket = "dudi-terraform-state"
    key = "network_project_terraform.tfstate"
    region = var.project_region
  }
}

