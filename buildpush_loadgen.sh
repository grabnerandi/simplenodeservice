#!/bin/bash

docker build -f ./load.Dockerfile -t grabnerandi/simplenodeservice:loadgen .
docker push grabnerandi/simplenodeservice:loadgen