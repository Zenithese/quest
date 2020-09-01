resource "aws_iam_role" "rearc-quest-terraform-iam-role" {
    name = "rearc-quest-terraform-iam-role"

    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "rearc-quest-terraform-policy" {
    role = aws_iam_role.rearc-quest-terraform-iam-role.name

    policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "ecr:BatchCheckLayerAvailability",
        "ecr:CompleteLayerUpload",
        "ecr:GetAuthorizationToken",
        "ecr:InitiateLayerUpload",
        "ecr:PutImage",
        "ecr:UploadLayerPart",
        "logs:CreateLogStream",
        "logs:CreateLogGroup",
        "logs:PutLogEvents"
      ]
    }
  ]
}
POLICY
}

resource "aws_codebuild_project" "rearc-quest-terraform-cb" {
    name = "rearc-quest-terraform-cb"
    service_role = aws_iam_role.rearc-quest-terraform-iam-role.arn
    build_timeout = "5"

    artifacts {
        type = "NO_ARTIFACTS"
    }

    environment {
        compute_type                = "BUILD_GENERAL1_SMALL"
        image                       = "aws/codebuild/standard:1.0"
        type                        = "LINUX_CONTAINER"
        image_pull_credentials_type = "CODEBUILD"

        environment_variable {
            name  = "REARC_QUEST_TERRAFORM_REPO"
            value = aws_ecr_repository.rearc-quest-terraform-ecr.repository_url
        }

        privileged_mode = true
    }

    source {
        type            = "GITHUB"
        location        = "https://github.com/Zenithese/quest.git"
        git_clone_depth = 1
        buildspec = "buildspec.yml"
    }

    source_version = "master"

}