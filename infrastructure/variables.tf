variable "name" {
  description = "Name for the application."
  type        = string
  default     = "mlflow"
}

variable "environment" {
  description = "Environment name to be used in the application name and aws tags"
  type        = string
  default     = "dev"
}

variable "image" {
  description = "Image name to push to ECR repo."
  type        = string
  default     = "mlflow-server"
}

variable "region" {
  description = "AWS region."
  type        = string
  default     = "ap-northeast-1"
}

variable "aws_access_key_id" {
  description = "AWS access key id for the MLFlow server."
  type        = string
}

variable "aws_secret_key" {
  description = "AWS access secret key for the MLFlow server."
  type        = string
}

variable "db_engine" {
  description = "The engine for the database."
  type = string
  default = "mysql"
}

variable "db_dialect" {
  description = "The dialect for the database."
  type = string
  default = "mysql+pymysql"
}

variable "db_version" {
  description = "The version for the database."
  type = string
  default = "8.0.28"
}

variable "db_instance_class" {
  description = "The instance class for the database."
  type = string
  default = "db.t2.micro"
}

variable "mlflow_tracking_username" {
  description = "Username for the MLflow tracking server."
  type = string
}

variable "mlflow_tracking_password" {
  description = "Password for the MLflow tracking server."
  type = string
}

variable "tags" {
  type        = map(string)
  description = "(Optional) AWS Tags common to all the resources created."
  default     = {}
}

variable "service_cpu" {
  description = "The number of cpu units reserved for the MLFlow container."
  type        = number
  default     = 1024
}

variable "service_memory" {
  type        = number
  default     = 2048
  description = "The amount (in MiB) of memory reserved for the MLflow container."
}
