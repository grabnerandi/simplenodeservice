#!/bin/bash

keptn create project keptnsample shipyard.yaml
sleep 10
keptn onboard service --project=keptnsample --values=values.yaml
