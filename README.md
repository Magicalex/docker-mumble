# docker-mumble

Docker image of server mumble (murmur)

## Features

* Based on Alpine Linux
* No **ROOT** process
* Persitance custom configuration for murmur

## Tag available

* latest [(Dockerfile)](https://github.com/magicalex/docker-mumble/Dockerfile)

## Usage

### Build image

```
cd docker-mumble
docker build -t magicalex/docker-mumble .
```

### Setup

Run mumble with a docker-compose.yml file

```yml
version: "3"

services:
  mumble:
    restart: always
    image: magicalex/docker-mumble
    container_name: mumble
    ports:
      - "64738:64738"
      - "64738:64738/udp"
    volumes:
      - /mnt/docker/mumble/conf:/opt/mumble/conf
      - /mnt/docker/mumble/data:/opt/mumble/data
```

Or without docker-compose file

```sh
docker run -dt \
  --name mumble \
  -p 64738:64738 \
  -p 64738:64738/udp \
  -v /docker/mumble/conf:/opt/mumble/conf \
  -v /docker/mumble/data:/opt/mumble/data \
  magicalex/docker-mumble:latest 
```

### Set a new password for 'SuperUser' account on server

```sh
docker exec -it mumble supw <new_password>
docker-compose restart mumble
```
