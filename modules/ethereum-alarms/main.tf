data "template_file" "cloudformation_sns_stack" {
  template = "${file("${path.module}/email_sns.tpl")}"

  vars {
    display_name  = "${var.name}-notifications"
    email_address = "${var.email}"
  }
}

resource "aws_cloudformation_stack" "sns_topic" {
  name          = "${var.name}-email-topic"
  template_body = "${data.template_file.cloudformation_sns_stack.rendered}"

  tags {
    name = "${var.name}-email-topic"
  }
}

resource "aws_cloudwatch_metric_alarm" "fulfilled_capacity" {
  alarm_name          = "${var.name}-fulfilled-capacity"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "FulfilledCapacity"
  namespace           = "AWS/EC2Spot"
  period              = "300"
  statistic           = "Maximum"
  threshold           = "1"
  ok_actions          = ["${aws_cloudformation_stack.sns_topic.outputs["arn"]}"]
  alarm_description   = "Monitors EC2 Spot Fleet fulfilled capacity."

  dimensions {
    FleetRequestId = "${var.spotfleet_id}"
  }
}
