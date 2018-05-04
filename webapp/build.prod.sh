# /bin/bash

TAG=0.0.1

docker build . -f Dockerfile.prod -t registry.k8s.sketchdev.io/evergreen-webapp:$TAG
