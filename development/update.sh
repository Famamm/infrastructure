#!/usr/bin/env bash
#
# Update the FleetOps API container in the DEVELOPMENT environment.
# Pulls the latest image and recreates the api service.
#
# Usage: ./update.sh
#
set -euo pipefail

# Always run from the directory containing this script.
cd "$(dirname "$0")"

ENV_FILE=".env.dev"
COMPOSE_FILE="docker-compose.dev.yml"
SERVICE="api"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Error: $ENV_FILE not found in $(pwd)" >&2
  exit 1
fi

echo "==> Pulling latest image for '$SERVICE' (development)..."
docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" pull "$SERVICE"

echo "==> Recreating '$SERVICE' container (development)..."
docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" up -d "$SERVICE"

echo "==> Done. Current status:"
docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" ps
