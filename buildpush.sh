#!/bin/bash

if [ -z $1 ] || [ -z $2 ]
then
  echo "Usage:"
  echo "buildpush.sh dockerhubrepo <BUILDNUMBER>"
  echo "Example: buildpush.sh grabnerandi/simplenodeservice 1"
  exit 1
fi

docker build --build-arg BUILD_NUMBER=$2 -t $1:$2.0.1 .
docker push $1:$2.0.1