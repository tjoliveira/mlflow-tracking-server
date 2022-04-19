#!/bin/bash

mlflow server --host 0.0.0.0 --port 5001 \
    --default-artifact-root $MLFLOW_ARTIFACT_URI \
    --backend-store-uri $MLFLOW_BACKEND_URI