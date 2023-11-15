#!/bin/bash

docker volume create vault-data
docker compose up --detach
docker exec vault /bin/sh -c "source /helpers/init.sh"
