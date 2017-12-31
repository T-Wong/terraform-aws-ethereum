output "iam_policy_id" {
  description = "The ethereum IAM policy ID."
  value       = "${aws_iam_policy.ethereum.id}"
}

output "iam_policy_arn" {
  description = "The ethereum IAM policy ARN."
  value       = "${aws_iam_policy.ethereum.arn}"
}

output "iam_policy_name" {
  description = "The ethereum IAM policy name."
  value       = "${aws_iam_policy.ethereum.name}"
}

output "iam_role_arn" {
  description = "The ethereum IAM role ARN."
  value       = "${aws_iam_role.ethereum.arn}"
}

output "iam_role_name" {
  description = "The ethereum IAM role name"
  value       = "${aws_iam_role.ethereum.name}"
}
