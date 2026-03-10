output "s3_bucket_name" {
  description = "Bucket name for Terraform state storage"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "region" {
  description = "AWS Region where backend resources are created"
  value       = aws_s3_bucket.terraform_state.region
}

output "s3_bucket_arn" {
  description = "ARN of S3 Bucket (Used to configure IAM Policy if needed)"
  value       = aws_s3_bucket.terraform_state.arn
}

