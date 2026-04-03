#!/bin/bash

ENV=${1:-local}

if [ ! -f ".env.$ENV" ]; then
  echo "Unknown environment: $ENV"
  echo "Usage: ./start.sh [local|prod]"
  exit 1
fi

echo "==> Starting proxy for environment: $ENV"
cp .env.$ENV .env
docker compose down
docker compose up -d
echo "Proxy running for $ENV"
