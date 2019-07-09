#!/bin/bash

set -e

if [[ $1 == 'build' ]]; then
    docker-compose -f docker-compose.dev.yml build ckan-dev
fi
docker-compose -f docker-compose.dev.yml up


