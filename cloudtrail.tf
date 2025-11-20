resource "aws_cloudtrail" "org_trail" {
  name                          = "OrganizationTrail"
  s3_bucket_name                = aws_s3_bucket.cloudtrail_logs.bucket
  is_multi_region_trail         = true
  include_global_service_events = true
  enable_log_file_validation    = true
  is_organization_trail         = true
}

resource "aws_s3_bucket" "cloudtrail_logs" {
  bucket = "organization-cloudtrail-logs"
  acl    = "private"
}