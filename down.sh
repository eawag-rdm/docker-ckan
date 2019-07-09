#!/bin/bash

set -e
docker-compose -f docker-compose.dev.yml down && \

if [[ "$1" == "dv" ]]; then
  docker volume prune -f
fi

