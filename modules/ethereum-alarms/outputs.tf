output "fulfilled_capacity_alarm_id" {
  description = "The CloudWatch Alarm ID."
  value       = "${aws_cloudwatch_metric_alarm.fulfilled_capacity.id}"
}

output "topic_arn" {
  description = "The SNS topic ARN where notifications are sent."
  value       = "${aws_cloudformation_stack.sns_topic.outputs["arn"]}"
}
