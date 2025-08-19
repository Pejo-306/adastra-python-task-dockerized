docker -H "ssh://$PROD_ENGINE?sshOptions=-o StrictHostKeyChecking=no" stack deploy -c docker-compose.prod-swarm.yml aptd-prod
