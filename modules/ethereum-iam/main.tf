data "aws_iam_policy_document" "ethereum_policy" {
  statement {
    actions = [
      "ec2:DescribeImages",
      "ec2:DescribeSubnets",
      "ec2:RequestSpotInstances",
      "ec2:TerminateInstances",
      "ec2:DescribeInstanceStatus",
      "ec2:CreateTags",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "iam:PassRole",
    ]

    resources = [
      "*",
    ]

    condition {
      test      = "StringEquals"
      variable = "iam:PassedToService"

      values = [
        "ec2.amazonaws.com",
        "ec2.amazonaws.com.cn",
      ]
    }
  }

  statement {
    actions = [
      "ec2:CreateTags",
    ]

    resources = [
      "arn:aws:ec2:*:*:instance/*",
      "arn:aws:ec2:*:*:spot-instances-request/*",
    ]

    condition {
      test      = "ForAllValues:StringEquals"
      variable  = "aws:TagKeys"

      values = [
        "aws:ec2spot:fleet-request-id",
      ]
    }
  }

  statement {
    actions = [
      "ec2:TerminateInstances",
    ]

    resources = [
      "*",
    ]

    condition {
      test      = "StringLike"
      variable  = "ec2:ResourceTag/aws:ec2spot:fleet-request-id"

      values = [
        "*",
      ]
    }
  }
}

data "aws_iam_policy_document" "ethereum_assume_role" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = [
        "spotfleet.amazonaws.com",
      ]
    }
  }
}

resource "aws_iam_policy" "ethereum" {
  name        = "${var.name}"
  description = "Allows EC2 Spot Fleet to launch and manage spot fleet instances"
  policy      = "${data.aws_iam_policy_document.ethereum_policy.json}"
}

resource "aws_iam_role" "ethereum" {
  name                = "${var.name}"
  description         = "IAM role for Ethereum instances"
  assume_role_policy  = "${data.aws_iam_policy_document.ethereum_assume_role.json}"
}

resource "aws_iam_role_policy_attachment" "ethereum" {
  role        = "${aws_iam_role.ethereum.name}"
  policy_arn  = "${aws_iam_policy.ethereum.arn}"
}
