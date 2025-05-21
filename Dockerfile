FROM ubuntu:latest

RUN export LANGUAGE=C.UTF-8; export LANG=C.UTF-8; export LC_ALL=C.UTF-8; export DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y openssl libssl-dev && \
    apt-get install -y python3 python3-pip && \
    apt-get install -y rustc cargo && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
    curl -fsSL https://get.docker.com | sh && \
    apt-get install -y protobuf-compiler && \
    python3 -m venv .venv && source .venv/bin/activate && \
    pip install -r requirements.txt && \
    docker pull xrpllabsofficial/xrpld:2.3.0

COPY rocket rocket/
