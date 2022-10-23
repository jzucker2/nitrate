# Docker

```
docker build -t nitrate:latest .
docker run -dp 5000:5000 nitrate
docker container ls
# container ID from above used below
docker exec -it f7ecbbadc663 /bin/sh
```

Docker compose

```
# don't always need --build
docker-compose up -d --build
docker-compose ps
docker-compose logs nitrate
docker-compose exec -it nitrate /bin/sh
docker-compose stop
```

## Dockerfile

The [reference page for Dockerfile is here](https://docs.docker.com/engine/reference/builder/)

I also should probably take advantage of `ONBUILD` [here](https://docs.docker.com/engine/reference/builder/#onbuild)

## Caching

Ideas about caching:

* https://gist.github.com/UrsaDK/f90c9632997a70cfe2a6df2797731ac8
