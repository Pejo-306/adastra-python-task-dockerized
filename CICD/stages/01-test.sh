docker-compose -f docker-compose.yml -f docker-compose.test.yml up -d 
sleep 5
EXIT_CODE=$(docker inspect adastra-python-task-dockerized_aptd_1 --format='{{.State.ExitCode}}')
echo $(docker logs adastra-python-task-dockerized_aptd_1)
docker-compose down
exit $EXIT_CODE