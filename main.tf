resource "newrelic_alert_policy" "infra_alert" {
  name = "infra_alert"
}

resource "newrelic_infra_alert_condition" "high_cpu_usage" {
  policy_id = newrelic_alert_policy.infra_alert.id

  name        = "High cpu usage"
  description = "Warning if cpu usage goes above 80% and critical alert if goes above 90%"
  type        = "infra_metric"
  event       = "SystemSample"
  select      = "cpuPercent"
  comparison  = "above"
  where       = "(hostname LIKE '%frontend%')"

  critical {
    duration      = 5
    value         = 90
    time_function = "all"
  }

  warning {
    duration      = 5
    value         = 80
    time_function = "all"
  }
}
