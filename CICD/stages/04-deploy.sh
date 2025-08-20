#!/usr/bin/env bash
set -x  # optional: bash debugging to echo each command

export DOCKER_HOST="ssh://$PROD_ENGINE"
export DOCKER_SSH_COMMAND="ssh -vvv -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

docker stack deploy -c docker-compose.prod-swarm.yml aptd-prod

