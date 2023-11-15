#!/bin/bash

docker compose down -v
docker volume rm vault-data
rm -f helpers/keys.json
rm -f helpers/role_id
rm -f helpers/secret_id
