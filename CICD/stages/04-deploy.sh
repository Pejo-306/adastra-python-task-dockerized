#!/usr/bin/env bash
set -euo pipefail
set -x  # optional: echo each command for debug

# Where to deploy
REMOTE=$PROD_ENGINE                     # e.g. ip172-18-0-65-xxxx@direct.labs.play-with-docker.com
STACK_NAME="aptd-prod"
REMOTE_PATH="/tmp/docker-compose.yml"

# 1) Copy the file over
echo "Uploading stack file..."
scp -o StrictHostKeyChecking=no docker-compose.prod-swarm.yml "${REMOTE}:${REMOTE_PATH}"

# 2) Run the deploy command over SSH
echo "Deploying via SSH..."
ssh -o StrictHostKeyChecking=no "$REMOTE" "docker stack deploy -c ${REMOTE_PATH} ${STACK_NAME}"
