resource "aws_iam_role" "app_runner_role" {
  name        = "${local.name}-app-runner-role"
  description = "This role gives App Runner permission to access ECR"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = [
            "build.apprunner.amazonaws.com"
          ]
        }
      },
    ]
  })
}

resource "aws_iam_policy" "ecr_access_policy" {
  name   = "${local.name}-ecr-access-policy"
  policy = data.aws_iam_policy.AWSAppRunnerServicePolicyForECRAccess.policy
}

resource "aws_iam_role_policy_attachment" "app_runner" {
  role       = aws_iam_role.app_runner_role.name
  policy_arn = aws_iam_policy.ecr_access_policy.arn
}

resource "aws_iam_role_policy" "access_bucket" {
  name = "${local.name}-access-bucket-policy"
  role = aws_iam_role.app_runner_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket",
          "s3:HeadBucket",
        ]
        Resource = concat(
          aws_s3_bucket.artifact_store.*.arn,
        )
      },
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucketMultipartUploads",
          "s3:GetBucketTagging",
          "s3:GetObjectVersionTagging",
          "s3:ReplicateTags",
          "s3:PutObjectVersionTagging",
          "s3:ListMultipartUploadParts",
          "s3:PutObject",
          "s3:GetObject",
          "s3:GetObjectAcl",
          "s3:GetObject",
          "s3:AbortMultipartUpload",
          "s3:PutBucketTagging",
          "s3:GetObjectVersionAcl",
          "s3:GetObjectTagging",
          "s3:PutObjectTagging",
          "s3:GetObjectVersion",
        ]
        Resource = [
          for bucket in concat(aws_s3_bucket.artifact_store.*.arn) :
          "${bucket}/*"
        ]
      },
    ]
  })
}
