resource "aws_codebuild_project" "backend" {
  name         = "backend-build"
  description  = "Build backend Docker image"
  service_role = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux-x86_64-standard:6.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true

    environment_variable {
      name  = "AWS_REPOSITORY_URI"
      value = aws_ecr_repository.backend.repository_url
    }
  }

  source {
    type      = "GITHUB"
    location  = "https://github.com/USER_NAME/REPO_NAME"
    buildspec = "buildspec.yml"
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "/aws/codebuild/backend-build"
    }
  }
}