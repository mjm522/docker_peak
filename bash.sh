#!/bin/bash

DOCKER_IMAGE=$1
WORK_DIR="${HOME}"

docker run -it \
    --privileged\
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --network="host" \
    --privileged \
    --workdir="$WORK_DIR" \
    $DOCKER_IMAGE \
    bash