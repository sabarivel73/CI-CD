resource "aws_iam_role_policy" "codepipeline" {
  name = "backend-codepipeline-policy"
  role = aws_iam_role.codepipeline.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:*"
        ]

        Resource = [
          aws_s3_bucket.pipeline_artifacts.arn,
          "${aws_s3_bucket.pipeline_artifacts.arn}/*"
        ]
      },

      {
        Effect = "Allow"

        Action = [
          "codebuild:StartBuild",
          "codebuild:BatchGetBuilds"
        ]

        Resource = aws_codebuild_project.backend.arn
      },

      {
            Effect: "Allow",

            Action: [
                "codeconnections:GetConnectionToken",
                "codeconnections:GetConnection",
                "codeconnections:UseConnection"
            ]

            Resource: [
                aws_codeconnections_connection.github.arn
            ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "codepipeline_ecs" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
  role = aws_iam_role.codepipeline.id
}