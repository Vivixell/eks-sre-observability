output "state_bucket" {
  value = aws_s3_bucket.state.id
}

output "ecr_repository_urls" {
  value = { for k, r in aws_ecr_repository.app : k => r.repository_url }
}

output "apply_role_arn" { value = aws_iam_role.github_deploy.arn }
output "plan_role_arn" { value = aws_iam_role.github_plan.arn }