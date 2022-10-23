resource "aws_iam_instance_profile" "terraria_server_profile" {
  name = "terraria_server_profile"
  role = aws_iam_role.terraria_server_role.name
}

resource "aws_iam_role" "terraria_server_role" {
  name = "terraria_server_role"

  assume_role_policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [{
        Sid    = "",
        Effect = "Allow",
        Action = "sts:AssumeRole",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
      }]
  })
}

resource "aws_iam_role_policy" "terraria_server_policy" {
  name = "terraria_server_policy"
  role = aws_iam_role.terraria_server_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Sid      = "",
      Effect   = "Allow",
      Resource = "*",
      Action = [
        "cloudwatch:DescribeInsightRules",
        "cloudwatch:GetDashboard",
        "cloudwatch:GetInsightRuleReport",
        "cloudwatch:GetMetricData",
        "cloudwatch:GetMetricStatistics",
        "cloudwatch:ListManagedInsightRules",
        "cloudwatch:ListMetrics",
        "cloudwatch:DescribeAnomalyDetectors",
        "cloudwatch:DescribeAlarmHistory",
        "cloudwatch:ListMetricStreams",
        "cloudwatch:DescribeAlarmsForMetric",
        "cloudwatch:ListDashboards",
        "cloudwatch:ListTagsForResource",
        "cloudwatch:DescribeAlarms",
        "cloudwatch:GetMetricStream",
        "cloudwatch:PutMetricData",
        "cloudwatch:GetMetricWidgetImage"
      ],
    }]
  })
}

