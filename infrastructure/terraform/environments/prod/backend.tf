terraform {
  backend "s3" {
    bucket = "nooblearn2code-terraform-state"
    key    = "homelab/env/prod/terraform.tfstate"
    region = "ap-southeast-1"
    # dynamodb_table = "nooblearn2code-terraform-lock"
    encrypt = true
  }
}

