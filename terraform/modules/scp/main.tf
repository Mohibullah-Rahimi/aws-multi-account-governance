# Service Control Policy module by Mohibullah-Rahimi
variable "name"       { type = string }
variable "content"    { type = string }
variable "target_id"  { type = string }

resource "aws_organizations_policy" "scp" {
  name        = var.name
  description = "SCP created by Mohibullah-Rahimi"
  type        = "SERVICE_CONTROL_POLICY"
  content     = var.content
}
resource "aws_organizations_policy_attachment" "attach" {
  policy_id = aws_organizations_policy.scp.id
  target_id = var.target_id
}
output "policy_id" { value = aws_organizations_policy.scp.id }