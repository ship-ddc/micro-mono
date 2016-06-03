#!/bin/bash -x

# build images for commit
docker build -t $REGISTRY_ACCOUNT_1/$APPLICATION/$SERVICE:latest .
