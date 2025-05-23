FROM python:3.13-slim-bookworm

RUN export LANGUAGE=C.UTF-8; export LANG=C.UTF-8; export LC_ALL=C.UTF-8; export DEBIAN_FRONTEND=noninteractive

COPY rocket rocket/
COPY entrypoint entrypoint.sh

ARG XRPLD="xrpllabsofficial/xrpld:2.4.0"

ENV ROCKET_XRPLD_DOCKER_CONTAINER=${XRPLD}

WORKDIR rocket

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
    apt-get install -y openssl libssl-dev && \
    apt-get install -y rustc cargo && \
    curl -fsSL https://get.docker.com | sh && \
    apt-get install -y protobuf-compiler && \
    python3 -m venv .venv && \
    source .venv/bin/activate && \
    python3 -m pip install -r requirements.txt

ENTRYPOINT ["entrypoint.sh"]
