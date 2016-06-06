FROM drydock/u14nod:prod

# FROM mhart/alpine-node:0.10
#
# RUN apk update && \
# apk add --no-cache bash \
#   git \
#   python \
#   openssh \
#   sudo

# this folder must be created in the base images
ADD . /root/_global/

ENTRYPOINT ["/root/init.sh"]
