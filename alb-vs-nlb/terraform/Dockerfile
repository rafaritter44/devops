FROM ghcr.io/opentofu/opentofu:minimal AS tofu

FROM ubuntu:24.04

COPY --from=tofu /usr/local/bin/tofu /usr/local/bin/tofu

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD ["bash"]