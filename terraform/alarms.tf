resource "aws_cloudwatch_metric_alarm" "terraria-server-down" {
  alarm_name                = "terraria-server-down"
  namespace                 = "Terraria"
  metric_name               = "ServerDown"
  statistic                 = "Maximum"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  threshold                 = "1"
  evaluation_periods        = "1"
  period                    = "300"
  alarm_description         = "This alarm is triggered by the metric Terraria/ServerDown published via cronjob on the Terraria Server EC2 instance if the server is not running."
  alarm_actions             = [aws_sns_topic.email_server_admin.arn]
  ok_actions                = []
  insufficient_data_actions = []
}

resource "aws_cloudwatch_metric_alarm" "terraria-server-disk" {
  alarm_name                = "terraria-server-disk"
  namespace                 = "Terraria"
  metric_name               = "DiskUsage"
  statistic                 = "Maximum"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  threshold                 = "90"
  evaluation_periods        = "1"
  period                    = "300"
  alarm_description         = "This alarm is triggered by the metric Terraria/DiskUsage published via cronjob on the Terraria Server EC2 instance if disk space is low."
  alarm_actions             = [aws_sns_topic.email_server_admin.arn]
  ok_actions                = []
  insufficient_data_actions = []
}

resource "aws_sns_topic" "email_server_admin" {
  name = "email_server_admin"
  # An email Subscription to this SNS Topic must be manually setup in AWS due to Terraform limitations.
}

