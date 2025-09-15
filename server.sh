#!/usr/bin/env bash


export MLFLOW_TRACKING_USERNAME=$MLFLOW_USERNAME
export MLFLOW_TRACKING_PASSWORD=$MLFLOW_PASSWORD
mlflow db upgrade $POSTGRESQL_URL
mlflow server \
  --host 0.0.0.0 \
  --port 8080 \
  --backend-store-uri $POSTGRESQL_URL \
  --artifacts-destination $STORAGE_URL 