#!/usr/bin/env bash
set -euo pipefail
set -x  # optional: echo each command for debug

KEY="/root/.ssh/id_ed25519"             # private key inside Jenkins container
REMOTE=$PROD_ENGINE                     # e.g. ip172-18-0-65-xxxx@direct.labs.play-with-docker.com
STACK_NAME="aptd-prod"
STACK_FILE="docker-compose.prod-swarm.yml"

export DOCKER_HOST="ssh://$REMOTE"
export DOCKER_SSH_COMMAND="ssh -i $KEY -o IdentitiesOnly=yes -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

# (Optional quick sanity: will exit non-zero if SSH/Docker isn't reachable)
docker info > /dev/null

# Deploy the stack (no need to copy the file manually)
docker stack deploy -c "$STACK_FILE" "$STACK_NAME"

