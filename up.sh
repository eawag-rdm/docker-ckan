#!/bin/bash

set -ex

docker-compose -f docker-compose.dev.yml build ckan-dev
docker-compose -f docker-compose.dev.yml up
