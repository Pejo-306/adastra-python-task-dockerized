export DOCKER_HOST="ssh://$PROD_ENGINE"
export DOCKER_SSH_CMD="ssh -o StrictHostKeyChecking=no"
docker stack deploy -c docker-compose.prod-swarm.yml aptd-prod
