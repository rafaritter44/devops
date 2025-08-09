FROM ghcr.io/opentofu/opentofu:minimal AS tofu

FROM ubuntu:24.04

COPY --from=tofu /usr/local/bin/tofu /usr/local/bin/tofu

WORKDIR /workspace

CMD ["bash"]