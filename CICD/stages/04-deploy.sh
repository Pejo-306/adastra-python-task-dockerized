docker-compose -f docker-compose.yml -f docker-compose.prod.yml config \
  | sed -E "s/cpus: ([0-9\\.]+)/cpus: '\\1'/" \
  | sed '/^version:/d' \
  > docker-compose.prod-swarm.yml
docker -H "ssh://$PROD_ENGINE" stack deploy -c docker-compose.prod-swarm.yml aptd-prod
