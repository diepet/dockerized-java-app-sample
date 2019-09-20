# dockerized-java-app-sample
Just a sample for analyzing how to Dockerize a Java app

## Create Docker image
```sh
docker build -t diepet/docker-java-app .
```

## Run Docker image
```sh
docker run -it --init --rm -p 8080:8080 -p 8010:8010 diepet/docker-java-app
```
Please note that:

* -it: terminal enabled
* --init: process does not run with PID 1 (fix jmap problem)
* --rm: remove the container after death (development phase)

## List running Docker containers
```sh
docker ps
```

## Open shell on a running Docker
```sh
docker exec -it <container_id> /bin/sh
```

## jmap java container
```sh
docker exec -it <container_id> jmap -histo:live `docker exec -it <container_id> pidof java | tr -d '\r\n'`
```