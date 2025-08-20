docker -H "ssh://$PROD_ENGINE" stack deploy -c docker-compose.prod-swarm.yml aptd-prod
