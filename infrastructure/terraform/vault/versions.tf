terraform {
  required_version = ">= 1.10.0"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "nooblearn2code-terraform-state"
    key     = "homelab/vault/terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
  }
}
