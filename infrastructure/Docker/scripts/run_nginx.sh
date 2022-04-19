#!/bin/bash

htpasswd -b -c /etc/nginx/.htpasswd $MLFLOW_TRACKING_USERNAME $MLFLOW_TRACKING_PASSWORD

nginx -g "daemon off;"