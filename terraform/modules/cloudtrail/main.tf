# Organization-wide CloudTrail by Mohibullah-Rahimi
variable "name"          { type = string }
variable "s3_bucket_name" { type = string }

resource "aws_s3_bucket" "trail_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
  versioning { enabled = true }
}

resource "aws_cloudtrail" "org_trail" {
  name                          = var.name
  s3_bucket_name                = aws_s3_bucket.trail_bucket.id
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  is_organization_trail         = true
}
output "trail_id" { value = aws_cloudtrail.org_trail.id }
output "bucket"  { value = aws_s3_bucket.trail_bucket.id }