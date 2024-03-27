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
  namespace                 = "CWAgent"
  metric_name               = "disk_used_percent"
  dimensions = {
    path = "/",
    Resource = "terraria-server",
    fstype = "ext4"
  }
  statistic                 = "Maximum"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  threshold                 = "75"
  evaluation_periods        = "1"
  period                    = "300"
  alarm_description         = "This alarm is triggered if the cw-agent running on the server EC2 instance reports high resource usage."
  alarm_actions             = [aws_sns_topic.email_server_admin.arn]
  ok_actions                = []
  insufficient_data_actions = []
}

resource "aws_cloudwatch_metric_alarm" "terraria-server-memory" {
  alarm_name                = "terraria-server-memory"
  namespace                 = "CWAgent"
  metric_name               = "mem_used_percent"
  dimensions = {
    Resource = "terraria-server"
  }

  statistic                 = "Maximum"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  threshold                 = "90"
  evaluation_periods        = "1"
  period                    = "300"
  alarm_description         = "This alarm is triggered if the cw-agent running on the server EC2 instance reports high resource usage."
  alarm_actions             = [aws_sns_topic.email_server_admin.arn]
  ok_actions                = []
  insufficient_data_actions = []
}

resource "aws_sns_topic" "email_server_admin" {
  name = "email_server_admin"
  # An email Subscription to this SNS Topic must be manually setup in AWS due to Terraform limitations.
}

