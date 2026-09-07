resource "aws_s3_bucket" "pipeline_artifacts" {
  bucket_prefix = "backend-codepipeline-"

  tags = {
    Name = "backend-codepipeline-artifacts"
  }
}