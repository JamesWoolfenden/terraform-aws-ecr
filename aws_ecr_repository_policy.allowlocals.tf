resource "aws_ecr_repository_policy" "allowlocals" {
  repository = "${aws_ecr_repository.repository.name}"

  policy = "${data.aws_iam_policy_document.allowlocals.json}"
}

data "aws_iam_policy_document" "allowlocals" {
  statement {
    sid = "AllowPushPull"

    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:*"]
    }

    resources = [
      "arn:aws:s3:::*"
    ]
  }
}
