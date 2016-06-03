FROM aye0aye/micro-image:flat.1
# MAINTAINER Avi "avi@shippable.com"

# get pre-reqs done
RUN mkdir -p /root/micro-smoker
ADD . /root/micro-smoker/

# now set it up
RUN /bin/bash /root/micro-smoker/setup.sh
