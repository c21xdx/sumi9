#!/bin/sh

export FLYCTL_INSTALL="/root/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
sed -i "s/8080/$PORT/" ./Caddyfile
chmod +x ./caddy
./caddy start
node ./dist-node/server/index.js
