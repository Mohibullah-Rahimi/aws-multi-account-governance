# IAM role for cross-account auditing by Mohibullah-Rahimi
variable "role_name"         { type = string }
variable "trusted_account_id" { type = string }

resource "aws_iam_role" "cross" {
  name = var.role_name
  # Auditing principal: Mohibullah-Rahimi's mgmt account
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { AWS = "arn:aws:iam::${var.trusted_account_id}:root" },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "read_only" {
  name = "AllowReadOnly-Mohibullah"
  role = aws_iam_role.cross.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:ListBucket",
          "cloudtrail:LookupEvents",
          "cloudtrail:DescribeTrails",
          "config:DescribeConfigurationRecorders"
        ],
        Resource = "*"
      }
    ]
  })
}

output "role_arn" { value = aws_iam_role.cross.arn }