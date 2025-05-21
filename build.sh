#! /bin/bash

# set up environment quickly
apt-get update -y
apt-get upgrade -y
apt-get install -y openssl libssl-dev
apt-get install -y rust cargo
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
apt-get install -y protobuf-compiler
curl https://sh.rustup.rs -sSf | sh -s -- -y

# build
cd rocket-interceptor
./build.sh
