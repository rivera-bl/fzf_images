provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "this" {
  count                = length(var.ecr-repo-name)
  name                 = element(var.ecr-repo-name, count.index)
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "this" {
  count      = length(var.ecr-repo-name)
  repository = element(var.ecr-repo-name, count.index)

  policy     = file("policy.tpl")
  depends_on = [aws_ecr_repository.this]
}
