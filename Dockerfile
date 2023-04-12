FROM ghcr.io/opensumi/opensumi-web:latest

USER root

WORKDIR /release

COPY Caddyfile run.sh ./

RUN apt-get update && \
    curl -L -H "Cache-Control: no-cache" -o ./caddy2.tar.gz  https://github.com/caddyserver/caddy/releases/download/v2.6.4/caddy_2.6.4_linux_amd64.tar.gz && \
    tar -C ./ -xzf ./caddy2.tar.gz && rm ./caddy2.tar.gz

CMD sh ./run.sh
