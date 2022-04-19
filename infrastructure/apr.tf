resource "time_sleep" "wait_30_seconds" {
  depends_on      = [aws_iam_role.app_runner_role]
  create_duration = "30s"
}

resource "aws_apprunner_service" "mlflow" {
  service_name = "${local.name}-server"

  source_configuration {
    image_repository {
      image_configuration {
        port = local.app_port
        runtime_environment_variables = {
          MLFLOW_ARTIFACT_URI = "s3://${aws_s3_bucket.artifact_store.id}/",
          MLFLOW_DB_DIALECT   = var.db_dialect
          MLFLOW_DB_USERNAME  = "${aws_db_instance.backend_store.username}"
          MLFLOW_DB_PASSWORD  = "${aws_db_instance.backend_store.password}"
          MLFLOW_DB_HOST      = "${aws_db_instance.backend_store.address}"
          MLFLOW_DB_PORT      = "${aws_db_instance.backend_store.port}"
          MLFLOW_DB_DATABASE  = "${aws_db_instance.backend_store.name}"
          MLFLOW_TRACKING_USERNAME = var.mlflow_tracking_username
          MLFLOW_TRACKING_PASSWORD = var.mlflow_tracking_password
          AWS_ACCESS_KEY_ID   = var.aws_access_key_id
          AWS_SECRET_ACCESS_KEY = var.aws_secret_key
          AWS_REGION          = var.region
        }
      }
      image_identifier      = "${local.aws_ecr_url}/${var.image}:latest"
      image_repository_type = "ECR"

    }
    authentication_configuration {
      access_role_arn = aws_iam_role.app_runner_role.arn
    }
  }
  depends_on = [time_sleep.wait_30_seconds]
  tags = {
    Name = "apprunner-service"
  }
}