#!/bin/bash

export MLFLOW_BACKEND_URI=${MLFLOW_DB_DIALECT}://${MLFLOW_DB_USERNAME}:${MLFLOW_DB_PASSWORD}@${MLFLOW_DB_HOST}:${MLFLOW_DB_PORT}/${MLFLOW_DB_DATABASE}

aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}
aws configure set default.region ${AWS_REGION}

./scripts/run_mlflow.sh &
./scripts/run_nginx.sh
