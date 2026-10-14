# bootstrap

Terraform bootstrap layer. Applied locally and manually, never through the pipeline, and not part of routine teardown.

Owns:
- S3 state bucket for all Terraform layers (versioned, encrypted, public access blocked, native locking)
- GitHub OIDC provider and the deploy role used by GitHub Actions
- ECR repositories for the application images

State is stored in the bucket it creates, at `bootstrap/terraform.tfstate`. It was applied with local state first, then migrated.

Before running Terraform here, clear any stale `AWS_*` credential variables, set `AWS_PROFILE`, and confirm the account with `aws sts get-caller-identity`.