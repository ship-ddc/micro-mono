FROM shippabledocker/micro-mono-repo:_global.master.latest

# FROM mhart/alpine-node:0.10
#
# RUN apk update && \
# apk add --no-cache bash \
#   git \
#   python \
#   openssh \
#   sudo

# this folder must be created in the base images
ADD . /root/micro-api/
ADD ../_global /root/_global

#now run set up
RUN /bin/bash /root/micro-api/setup.sh

ENTRYPOINT ["/root/micro-api/boot.sh"]
