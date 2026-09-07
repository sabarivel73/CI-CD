resource "aws_s3_bucket" "pipeline_artifacts" {
  bucket_prefix = "backend-codepipeline-"
  force_destroy  = true
  tags = {
    Name = "backend-codepipeline-artifacts"
  }
}