# Uncomment if you need more outputs

/*
output "db_username" {
  value     = aws_db_instance.backend_store.password
  sensitive = true
}

output "db_password" {
  value     = aws_db_instance.backend_store.password
  sensitive = true
}

output "db_port" {
  value = aws_db_instance.backend_store.port
}
*/

output "mlflow_server_url" {
  value = "https://${aws_apprunner_service.mlflow.service_url}"
}
