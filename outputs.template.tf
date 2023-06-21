output "ecs_task_security_group_id" {
  value = aws_security_group.ecs_task_sg.id
}

output "docker_registry_url" {
  value = aws_ecr_repository.ecr_repo.repository_url
}

{% if monitoring_enabled %}
output "monitoring_alarms" {
  value = [aws_cloudwatch_metric_alarm.cpu_utilization_high.alarm_name,
  aws_cloudwatch_metric_alarm.memory_utilization_high.alarm_name]
}
{% endif %}

{% if monitoring_enabled %}
output "lb_monitoring_alarms" {
  value = [aws_cloudwatch_metric_alarm.http_code_target_3xx_count_high.alarm_name,
  aws_cloudwatch_metric_alarm.http_code_target_4xx_count_high.alarm_name,
  aws_cloudwatch_metric_alarm.http_code_target_5xx_count_high.alarm_name,
  aws_cloudwatch_metric_alarm.http_code_elb_5xx_count_high.alarm_name,
  aws_cloudwatch_metric_alarm.target_response_time_average_high.alarm_name,
]
}
{% endif %}

output "ecs_service_name" {
  value = aws_ecs_service.app.name
}