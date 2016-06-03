#!/bin/bash -x

cd /root/micro-api

# get the pre installed nodemodules to here to save demo time
# comment this out to do native install
# mv /root/micro-image/node_modules .

# install node modules. the above mv will make this zip through as nothing new is installed
npm config set loglevel warn
npm install --production

# # install python and pip
# apt-get update
# sudo apt-get install build-essential checkinstall
# sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev \
# libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
# cd /usr/src
# wget https://www.python.org/ftp/python/3.4.4/Python-3.4.4.tgz
# sudo tar xzf Python-3.4.4.tgz
# cd Python-3.4.4
# sudo ./configure
# sudo make altinstall
# python3.4 -V
#
# # install pip
# apt-get -y install python-pip
# pip -V

# install awscli
# apt-get remove python-pip
# easy_install pip
# SUDO=$(which sudo) && $SUDO pip install awscli
