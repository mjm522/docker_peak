#!/bin/bash

ROOT_DIR="$(cd $( dirname ${BASH_SOURCE[0]} ) && pwd)"

IMAGE_TAG=ubuntu1804
DOCKER_USER=test_peak
DOCKER_GID=998
DOCKER_UID=998

/bin/bash docker_build.sh $IMAGE_TAG  ${DOCKER_USER} ${DOCKER_GID} ${DOCKER_UID}

/bin/bash bash.sh dev:$IMAGE_TAG 
