#!/usr/bin/env bash
set -euo pipefail
set -x  # <— turn on bash debug mode (prints every command before running it)

# Generate swarm-compatible compose file
docker-compose -f docker-compose.yml -f docker-compose.prod.yml config \
  | sed -E "s/cpus: ([0-9\\.]+)/cpus: '\\1'/" \
  | sed '/^version:/d' \
  | sed '/^x-/,/^services:/d' \   # <— REMOVE x-* extension blocks
  > docker-compose.prod-swarm.yml

# Show the generated file for debugging
echo "======= GENERATED docker-compose.prod-swarm.yml ======="
cat docker-compose.prod-swarm.yml
echo "======================================================="

# Actually attempt deploy
docker -H "ssh://$PROD_ENGINE" stack deploy -c docker-compose.prod-swarm.yml aptd-prod

