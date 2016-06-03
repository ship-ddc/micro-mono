FROM mhart/alpine-node

RUN apk add --no-cache bash

# MAINTAINER Avi "avi@shippable.com"

ENV DEBIAN_FRONTEND noninteractive

# get pre-reqs done
RUN mkdir -p /root/micro-image
ADD . /root/micro-image/

# now set it up
RUN /bin/bash /root/micro-image/setup.sh
