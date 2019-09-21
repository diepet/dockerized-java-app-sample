# dockerized-java-app-sample
Just a sample for analyzing how to Dockerize a Java app

## Create Docker image
```sh
docker build -t diepet/docker-java-app .
```

## Run Docker image
```sh
docker run -it --init --rm -p 8000:8000 -p 8080:8080 -p 9010:9010 diepet/docker-java-app
```
Please note that:

* -it: terminal enabled
* --init: process does not run with PID 1 (fix jmap problem)
* --rm: remove the container after death (development phase)

Furtermore:

* Port 8080: it is used for HTTP connections (try http://localhost:8080/ in your web browser after launched)
* Port 8000: it is used for remote debugging
* Port 9010: it is used for JMX connections

## List running Docker containers
```sh
docker ps
```

## Open shell on a running Docker
```sh
docker exec -it <container_id> /bin/sh
```

## Launch jmap for the running Java process inside the Docker container
```sh
docker exec -it <container_id> jmap -histo:live `docker exec -it <container_id> pidof java | tr -d '\r\n'`
```