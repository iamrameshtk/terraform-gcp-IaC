# https://www.terraform.io/language/settings/backends/gcs
terraform {

  /* backend "gcs" {
    bucket = "rk-terraform-storage"
    prefix = "terraform/state"
  }*/

  required_providers {

    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }

    external = {
      source = "hashicorp/external"
      version = "2.2.2"
    }
    
  }
}
