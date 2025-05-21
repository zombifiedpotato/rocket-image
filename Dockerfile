FROM ubuntu:latest

RUN export LANGUAGE=C.UTF-8; export LANG=C.UTF-8; export LC_ALL=C.UTF-8; export DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y openssl libssl-dev && \
    apt-get install -y python3.13 python3.13-dev && \
    apt-get install -y rustc cargo && \
    curl -fsSL https://get.docker.com | sh && \
    apt-get install -y protobuf-compiler
RUN virtualenv --python python3.13 venv && \
    source venv/bin/activate
RUN python3.13 -m pip install -r requirements.txt
RUN docker pull xrpllabsofficial/xrpld:2.3.0

COPY rocket rocket/
