#!/bin/bash
set -e

echo "Pulling latest production branch..."
git fetch origin production
git reset --hard origin/production

echo "Rebuilding containers..."
docker compose -f docker-compose.prod.yml down
docker compose -f docker-compose.prod.yml build --no-cache
docker compose -f docker-compose.prod.yml up -d

echo "✅ Deployment complete!"

