FROM ubuntu:latest

RUN export LANGUAGE=C.UTF-8; export LANG=C.UTF-8; export LC_ALL=C.UTF-8; export DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y openssl libssl-dev
RUN apt-get install -y python3
RUN apt-get install -y rustc cargo
RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
RUN apt-get install -y protobuf-compiler
RUN pip install -r requirements.txt
RUN docker pull xrpllabsofficial/xrpld:2.3.0

COPY rocket rocket/
