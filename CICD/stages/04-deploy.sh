#!/usr/bin/env bash
set -euo pipefail
set -x  # optional: echo each command for debug

# Where to deploy
KEY="/root/.ssh/id_ed25519"             # private key inside Jenkins container
REMOTE=$PROD_ENGINE                     # e.g. ip172-18-0-65-xxxx@direct.labs.play-with-docker.com
STACK_NAME="aptd-prod"
REMOTE_PATH="/tmp/docker-compose.yml"
SSH_OPTS="-i $KEY -o IdentitiesOnly=yes -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

# 1) Copy the file over
echo "Uploading stack file..."
scp $SSH_OPTS docker-compose.prod-swarm.yml "${REMOTE}:${REMOTE_PATH}"

# 2) Run the deploy command over SSH
echo "Deploying via SSH..."
ssh $SSH_OPTS "$REMOTE" "docker stack deploy -c ${REMOTE_PATH} ${STACK_NAME} --with-registry-auth && docker stack services $STACK_NAME"
