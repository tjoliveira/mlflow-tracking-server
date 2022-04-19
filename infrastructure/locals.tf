locals {
  
  name = "${var.name}-${var.environment}"

  # RDS database
  db_username = "mlflow"
  db_name     = "mlflow"
  db_port     = 3306

  # Appp Runner
  app_port = 80

  # URL for the ECR repository 
  aws_ecr_url = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.region}.amazonaws.com"

  tags = merge(
    {
      "Environment" = "${var.environment}"
    },
    var.tags
  )
}