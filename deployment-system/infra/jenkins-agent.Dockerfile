FROM jenkins/inbound-agent:latest

USER root

RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-pip \
    curl \
    bash \
    docker.io \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash