#!/bin/bash -x

dpkg-divert --local --rename --add /sbin/initctl;
ln -s /bin/true /sbin/initctl;
echo "en_US.UTF-8 UTF-8" >> /var/lib/locales/supported.d/local;
locale-gen en_US en_US.UTF-8;
dpkg-reconfigure locales;
echo 'ALL ALL=(ALL) NOPASSWD:ALL' | tee -a /etc/sudoers;

echo "================== Adding empty known hosts file =============="
mkdir -p /root/.ssh;
touch /root/.ssh/known_hosts;

cd /root/micro-image

# echo "================== Forcing apt-get installs =============="
# cp 90forceyes /etc/apt/apt.conf.d/90forceyes;

echo "================== Disabling strict host checking =============="
cp config /root/.ssh/config;


# echo "================= Installing core binaries ==================="
# apt-get update;
# apt-get install -yy python-dev software-properties-common;
# add-apt-repository -y ppa:ubuntu-toolchain-r/test;
# apt-get update

# echo "deb http://archive.ubuntu.com/ubuntu trusty main universe restricted multiverse" > /etc/apt/sources.list;
# apt-get install -yy g++-4.9 wget texinfo sudo git-core python-pip;

# echo "================== Installing python requirements=============="
# pip install -r requirements.txt;

# echo "================= Installing Node ==================="
# add-apt-repository ppa:chris-lea/node.js;
# apt-get update;
# apt-get install -y nodejs;

echo "================= Installing Node packages ==================="
npm install -g grunt grunt-cli
npm install

echo "================= Create app folders ==================="
mkdir -p /root/micro-api
# mkdir -p /root/micro-www
