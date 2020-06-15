# magicalex/mumble

![](https://github.com/magicalex/docker-mumble/workflows/build/badge.svg?branch=master&event=push)
[![](https://img.shields.io/docker/pulls/magicalex/mumble)](https://hub.docker.com/r/magicalex/mumble)
[![](https://img.shields.io/docker/stars/magicalex/mumble)](https://hub.docker.com/r/magicalex/mumble)

## Features

- Based on Alpine Linux (3.12)
- Multi-platform image: `linux/386`, `linux/amd64`, `linux/arm/v6`, `linux/arm/v7`, `linux/arm64`
- No root process
- Persitance custom configuration for murmur
- murmur version (1.3.1)

Github repository of mumble: https://github.com/mumble-voip/mumble

## Tag available

- latest [(Dockerfile)](https://github.com/Magicalex/docker-mumble/blob/master/Dockerfile)

## Usage

#### Build image

```
cd docker-mumble
docker build -t magicalex/mumble .
```

#### Setup

Run mumble with a docker-compose.yml file

```yml
version: "3"

services:
  mumble:
    restart: always
    image: magicalex/mumble:latest
    container_name: mumble
    ports:
      - "64738:64738"
      - "64738:64738/udp"
    volumes:
      - /mnt/docker/mumble/conf:/opt/mumble/conf
      - /mnt/docker/mumble/data:/opt/mumble/data
```

run `docker-compose up -d`

Or without docker-compose

```sh
docker run -dt \
  --name mumble \
  -p 64738:64738 \
  -p 64738:64738/udp \
  -v /docker/mumble/conf:/opt/mumble/conf \
  -v /docker/mumble/data:/opt/mumble/data \
  magicalex/mumble:latest
```

#### Set a new password for 'SuperUser' account on server

```sh
docker exec -it mumble supw <new_password>
docker-compose restart mumble
```

## License

Docker image [magicalex/mumble](https://hub.docker.com/r/magicalex/mumble) is released under [MIT License](https://github.com/Magicalex/docker-mumble/blob/master/LICENSE)
