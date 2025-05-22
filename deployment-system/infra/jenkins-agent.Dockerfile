FROM docker:dind

RUN apk add --no-cache \
    git \
    python3 \
    py3-pip \
    curl \
    bash

RUN ln -sf python3 /usr/bin/python && ln -sf pip3 /usr/bin/pip

RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash