FROM ghcr.io/opensumi/opensumi-web:latest

USER root

ENV PORT 8080

WORKDIR /release

COPY Caddyfile run.sh ./

# ------------------------------------------------------------------------------
# Install Caddy
RUN apt-get update && apt-get install sudo -y && \
    curl -L -H "Cache-Control: no-cache" -o ./caddy2.tar.gz  https://github.com/caddyserver/caddy/releases/download/v2.6.4/caddy_2.6.4_linux_amd64.tar.gz && \
    tar -C ./ -xzf ./caddy2.tar.gz && rm -rf ./caddy2.tar.gz

# ------------------------------------------------------------------------------
# Install rclone golang and others
RUN curl -s https://dl.google.com/go/go1.20.3.linux-amd64.tar.gz -o /tmp/golang.tar.gz && \
    rm -rf /usr/local/go && tar -C /usr/local -xzf /tmp/golang.tar.gz && rm /tmp/golang.tar.gz && \
    curl https://get.okteto.com -sSfL | sh && curl -L https://fly.io/install.sh | sh  && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------

EXPOSE $PORT

CMD sh ./run.sh
