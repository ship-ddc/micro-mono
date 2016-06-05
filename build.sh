#!/bin/bash -e

export IMAGE_NAME=ttrahan/micro-mono
if [ "$IS_PULL_REQUEST" != true ]; then
  sudo docker build -t $IMAGE_NAME:$BRANCH.$SHIPPABLE_BUILD_NUMBER .
  sudo docker push $IMAGE_NAME:$BRANCH.$SHIPPABLE_BUILD_NUMBER
else
  echo "skipping because it's a PR"
fi
