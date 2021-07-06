docker-compose -f docker-compose.yml -f docker-compose.prod.yml config > docker-compose.prod-swarm.yml
docker -H "ssh://$PROD_ENGINE" stack deploy -c docker-compose.prod-swarm.yml aptd