export DOCKER_HOST="ssh://$PROD_ENGINE"
export DOCKER_SSH_COMMAND="ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
docker stack deploy -c docker-compose.prod-swarm.yml aptd-prod
