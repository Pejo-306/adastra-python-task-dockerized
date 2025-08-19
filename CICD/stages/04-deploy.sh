ssh-keyscan -H $(echo $PROD_ENGINE | cut -d@ -f2) >> ~/.ssh/known_hosts
docker -H "ssh://$PROD_ENGINE" stack deploy -c docker-compose.prod-swarm.yml aptd-prod
