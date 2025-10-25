#!/bin/bash
set -e

echo "Pulling latest production branch..."
git fetch origin production
git reset --hard origin/production

echo "Rebuilding containers..."
docker compose -f docker-compose.prod.yaml down
docker compose -f docker-compose.prod.yaml build --no-cache
docker compose -f docker-compose.prod.yaml up -d

echo "✅ Deployment complete!"

