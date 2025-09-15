# entrypoint.sh
#!/usr/bin/env bash
set -euo pipefail
: "${PORT:=8080}"
: "${POSTGRESQL_URL:?missing}"
: "${STORAGE_URL:?missing}"
exec mlflow server \
  --host 0.0.0.0 --port "$PORT" \
  --backend-store-uri "$POSTGRESQL_URL" \
  --default-artifact-root "$STORAGE_URL"