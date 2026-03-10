# Create S3 bucket for Terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "nooblearn2code-terraform-state"

  lifecycle {
    prevent_destroy = true
  }
}

# Block public access
resource "aws_s3_bucket_public_access_block" "default" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
