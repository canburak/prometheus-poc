#!/bin/bash
set -vx

docker-compose down --volumes
docker-compose build test
docker-compose --profile testing up --abort-on-container-exit --exit-code-from test test
docker-compose down --volumes
