terraform {
  backend "s3" {
    bucket = "nooblearn2code-terraform-state"
    key    = "homelab/global/s3-backend/terraform.tfstate"
    region = "ap-southeast-1"
    # dynamodb_table = "nooblearn2code-terraform-lock"
    encrypt = true
  }
}

